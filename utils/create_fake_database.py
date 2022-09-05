"""
This python script will create some tables including random data for educational purposes.
"""
#%% Import Libs
from pathlib import Path
import pandas as pd
import names
from random import randint, random

#%% Init a database
db = dict(
    players=pd.DataFrame(),
    teams=pd.DataFrame(),
    nationalities=pd.DataFrame(),
)

GENDERS = (
    "male",
    "female"
)

SALARY_SCALE_FACTOR = (
    100_000,
    1_000_000,
    10_000_000
)
SALARY_OFFSET = 100_000
AGE_RANGE = (18, 40)
N_TEAMS = 1_000

#%% Generate fake data
N = 10_000_000
lst_players = []
for idx in range(N):
    id = idx
    idx_gender = int(random() * len(GENDERS))
    gender = GENDERS[idx_gender]
    fname = names.get_first_name(gender=gender)
    lname = names.get_last_name()
    age = randint(AGE_RANGE[0], AGE_RANGE[1])
    idx_salary_scale_factor = int(random() * len(SALARY_SCALE_FACTOR))
    salary = int(random() * SALARY_SCALE_FACTOR[idx_salary_scale_factor]) + SALARY_OFFSET
    team = "Team " + str(randint(1, N_TEAMS))

    lst_players.append([id, gender, fname, lname, age, team, salary])
    print(lst_players[-1])
