from itertools import combinations
import random
from timeit import Timer, timeit


def my_knapsack(weight_cap, weights, values):
    # Write your code here
    options = getCombinations(len(weights))
    max_value = 0
    for combination in options:
        weight = 0
        val = 0
        for i in combination:
            weight += weights[i]
            val += values[i]
        if weight <= weight_cap and val > max_value:
            max_value = val
    return max_value


def getCombinations(n: int):
    options = []
    for i in range(n):
        options += list(combinations(range(n), i+1))
    return options


# ===================================================================================
def knapsack(weight_cap, weights, values):
    # create a two dimensional array for Memoization, each element is initialized to '-1'
    dp = [[-1 for x in range(weight_cap+1)] for y in range(len(values))]
    return knapsack_recursive(dp, values, weights, weight_cap, 0)


def knapsack_recursive(dp, profits, weights, capacity, currentIndex):

    # base case checks
    if capacity <= 0 or currentIndex >= len(profits):
        return 0

    # if we have already solved a similar problem, return the result from memory
    if dp[currentIndex][capacity] != -1:
        return dp[currentIndex][capacity]

    # recursive call after choosing the element at the currentIndex
    # if the weight of the element at currentIndex exceeds the capacity, we
    # shouldn't process this
    profit1 = 0
    if weights[currentIndex] <= capacity:
        profit1 = profits[currentIndex] + knapsack_recursive(
            dp, profits, weights, capacity - weights[currentIndex], currentIndex + 1)

    # recursive call after excluding the element at the currentIndex
    profit2 = knapsack_recursive(
        dp, profits, weights, capacity, currentIndex + 1)

    dp[currentIndex][capacity] = max(profit1, profit2)
    return dp[currentIndex][capacity]

# =====================================================================================


# weight_cap = 77
# weights = [45, 32]
# values = [17, 92]
# print(my_knapsack(weight_cap, weights, values))
k = 30
print(getCombinations(15))
# weights = random.choices(range(1000), k=k)
# values = random.choices(range(1000), k=k)
# weight_cap = random.randrange(5000, 10000, 1)
# print(f'weights: {weights}')
# print(f'values: {values}')
# print(f'cap: {weight_cap}')

# ret = knapsack(weight_cap, weights, values)
# print(ret)
# their_time = timeit(knapsack(weight_cap, weights, values))
