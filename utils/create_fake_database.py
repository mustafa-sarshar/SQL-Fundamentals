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
N_TEAMS = 1_000
N_PLAYERS = 100_000
AGE_RANGE = (18, 40)

#%% Generate fake data
# Create the fake team table
lst_teams = []
for idx_team in range(N_TEAMS):
    dict_team = dict(
        team_id=idx_team,
        team_name="Team " + str(idx_team+1)
    )
    lst_teams.append(dict_team)

lst_contracts = []
for idx_player in range(N_PLAYERS):
    n_contracts = randint(1, 5)
    for idx_contract in range(n_contracts):
        salary = int(random() * SALARY_SCALE_FACTOR[int(random() * len(SALARY_SCALE_FACTOR))]) + SALARY_OFFSET
        dict_contracts = dict(
            contract_id=idx_contract,
            player_id=idx_player,
            salary=salary
        )
        lst_contracts.append(dict_contracts)

lst_players = []
for idx_player in range(N_PLAYERS):
    gender = GENDERS[int(random() * len(GENDERS))]
    dict_player = dict(
        player_id=idx_player,
        gender=gender,
        fname=names.get_first_name(gender=gender),
        lname=names.get_last_name(),
        age=randint(AGE_RANGE[0], AGE_RANGE[1]),
        team_id=randint(0, N_TEAMS)
    )
    lst_players.append(dict_player)

# %%
