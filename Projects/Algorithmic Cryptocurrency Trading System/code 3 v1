# Including the necessary Library Files 
import time
import copy
import numpy as np
import pandas as pd
import chainer
import chainer.functions as F
import chainer.links as L
from plotly import tools
from plotly.graph_objs import *
from plotly.offline import init_notebook_mode, iplot, iplot_mpl
import matplotlib.pyplot as plt
import tensorflow as tf
import pandas as pd
import matplotlib
import seaborn as sns


class Environment1:

    def __init__(self, data, past_t=90):
        self.data = data
        self.past_t = past_t
        self.reset()

    def reset(self):
        self.t = 0
        self.status = False
        self.prof = 0
        self.pos = []
        self.pos_val = 0
        self.past = [0 for _ in range(self.past_t)]
        return [self.pos_val] + self.past  # observation

    def step(self, act):
        reward = 0

        # act = 0: stay, 1: buy, 2: sell
        if (act == 1):
            # Buy the current position
            self.pos.append(self.data.iloc[self.t, :]['Close'])
        elif (act == 2):  # sell
            if len(self.pos) == 0:
                reward = -1
            else:
                prof = 0
                # Sell all the held pos
                for p in self.pos:
                    prof = prof + (self.data.iloc[self.t, :]['Close'] - p)
                reward = reward + prof
                self.prof = self.prof + prof
                self.pos = []

        # set next time
        self.t = self.t + 1
        self.pos_val = 0
        for p in self.pos:
            self.pos_val = self.pos_val + (self.data.iloc[self.t, :]['Close'] - p)
        self.past.pop(0)
        self.past.append(self.data.iloc[self.t, :]['Close'] - self.data.iloc[(self.t - 1), :]['Close'])

        # clipping reward
        if (reward > 0):
            reward = 1
        elif (reward < 0):
            reward = -1

        return ([self.pos_val] + self.past, reward, self.status)  # observation, reward, status


def bitcoin_graph(symbol,title):
    dates = pd.date_range('2015-01-01', '2018-12-31')
    # df = pd.DataFrame(index=dates)
    df = pd.read_csv('{}'.format(symbol), index_col='Date', parse_dates=True, usecols=['Date', 'Close'])
    df[['Close']].plot()
    df.plot()
    plt.title(title)
    plt.show()


# bitcoin_graph("btc_usd.csv", "BTC")

# Reading the data file as a data frame
data = pd.read_csv('btc_usd.csv')

# Converting the date column to date format
data['Date'] = pd.to_datetime(data['Date'])
data = data.set_index('Date')


# Printing a summary of the data
print(data.head())

# Generating the train and test data
date_split = '2017-01-01'
train = data[:date_split]
test = data[date_split:]
print(len(train), len(test))

# env = Environment1(train)
# # print(env.reset())
# for _ in range(3):
#     # choose any number between 0, 1 and 2
#     past_action = np.random.randint(3)
#     print('The chosen random number is ', past_action)
#     print(env.step(past_action))

# A function to train the deep Q learning model
def train_deep_Q_network(env):
    class Q_Network(chainer.Chain):

        def __init__(self, inp_size, init_size, opt_size):
            super(Q_Network, self).__init__(
                fc1=L.Linear(inp_size, init_size),
                fc2=L.Linear(init_size, init_size),
                fc3=L.Linear(init_size, opt_size)
            )

        def __call__(self, x):
            h = F.relu(self.fc1(x))
            h = F.relu(self.fc2(h))
            y = self.fc3(h)
            return y

        def reset(self):
            self.zerograds()

    #Intializing the variables 
    Q = Q_Network(inp_size=env.past_t + 1, init_size=200, opt_size=3)
    Q_ast = copy.deepcopy(Q)
    optimizer = chainer.optimizers.Adam()
    optimizer.setup(Q)
    
    number_of_epochs = 100 # The number of epochs to be tried is set to be 100
    maximum_steps = len(env.data) - 1
    mem_size = 200
    batch_data_size = 20 # Fixing a batch size of 20 per cycle
    epsilon = 1.0 # The value of epsilon is set to 1
    epsilon_reduce = 1e-4 # The epsilon reduce size
    min_epsilon = 0.1 # The min value to which epsilon can reduce to
    begin_decrease_epsilon = 400
    train_frequency = 10
    update_Q_frequecny = 20
    gamma_val = 0.97
    log_frequency = 5

    mem = []
    number_of_steps = 0 # Initializing an iterator for the number of steps
    net_rewards = [] # A list to store the net rewards and losses for the actions of our agent
    net_losses = []

    begin = time.time()
    for epoch in range(number_of_epochs):

        past_observation = env.reset()
        step = 0
        status = False  # A status variable to determine when to end the training
        net_reward = 0
        net_loss = 0

        while not status and step < maximum_steps:

            # select action
            past_action = np.random.randint(3)
            if (np.random.rand() > epsilon):
                past_action = Q(np.array(past_observation, dtype=np.float32).reshape(1, -1))
                past_action = np.argmax(past_action.data)

            # action
            observation, reward, status = env.step(past_action)

            # add it to memmory
                        # state, action, reward, new_state, status
            mem.append((past_observation, past_action, reward, observation, status))
            if (len(mem) > mem_size):
                mem.pop(0)

            # train or update the Q value
            if (len(mem) == mem_size):
                if (number_of_steps % train_frequency == 0):
                    shuffled_mem = np.random.permutation(mem)
                    mem_idx = range(len(shuffled_mem))
                    for i in mem_idx[::batch_data_size]:
                        batch = np.array(shuffled_mem[i:i + batch_data_size])
                        b_past_observation = np.array(batch[:, 0].tolist(), dtype=np.float32).reshape(batch_data_size,-1)
                        b_past_action = np.array(batch[:, 1].tolist(), dtype=np.int32)
                        b_reward = np.array(batch[:, 2].tolist(), dtype=np.int32)
                        b_observation = np.array(batch[:, 3].tolist(), dtype=np.float32).reshape(batch_data_size, -1)
                        b_status = np.array(batch[:, 4].tolist(), dtype=np.bool)

                        q = Q(b_past_observation)
                        Q_maximum_val = np.max(Q_ast(b_observation).data, axis=1)
                        final_ans = copy.deepcopy(q.data)
                        for j in range(batch_data_size):
                            final_ans[j, b_past_action[j]] = b_reward[j] + gamma_val * Q_maximum_val[j] * (not b_status[j])
                        Q.reset()
                        loss = F.mean_squared_error(q, final_ans) # Computing the mean squared erroe loss
                        net_loss = net_loss + loss.data
                        loss.backward()
                        optimizer.update() # Updating the optimizer

                if (number_of_steps % update_Q_frequecny == 0):
                    Q_ast = copy.deepcopy(Q)

            # epsilon
            if (epsilon > min_epsilon and number_of_steps > begin_decrease_epsilon):
                epsilon = epsilon - epsilon_reduce # Updating the epsilon value

            # next step
            net_reward = net_reward + reward # Incrementing the reward
            past_observation = observation # storing the observation in past observation
            step = step + 1 # Incrementing the step counter
            number_of_steps = number_of_steps + 1 # Incrementing the number of steps taken

        net_rewards.append(net_reward)
        net_losses.append(net_loss)
 
        # Computing the rewards and losses in log scale
        if ((epoch + 1) % log_frequency == 0):
            reward_log = sum(net_rewards[((epoch + 1) - log_frequency):]) / log_frequency
            log_loss = sum(net_losses[((epoch + 1) - log_frequency):]) / log_frequency
            elapsed_time = time.time() - begin
            print('\t'.join(map(str,[epoch + 1, epsilon, number_of_steps, reward_log,log_loss, elapsed_time]))) # Printing the results
            begin = time.time()

    return (Q, net_losses, net_rewards)


Q, net_losses, net_rewards = train_deep_Q_network(Environment1(train))