# MindsDB Con 2023 Demo
## A D&D dungeon master assistant – Powered by MindsDB and LangChain
### June 1st, 2023

This short readme provides instructions on how to run the example shown at the first session of the conference (VOD [here](https://www.youtube.com/live/bC5jYHO-aNk?feature=share&t=767), session starts roughly 13 minutes in).

## Requirements

1. A local deployment of `MindsDB`. **Note**: for now it *must* be cloned from source, and in the `staging` branch. You can follow instructions [here](https://docs.mindsdb.com/setup/self-hosted/pip/source).
2. All langchain-related dependencies must also be installed, you can find the list [here](https://github.com/mindsdb/mindsdb/blob/staging/mindsdb/integrations/handlers/langchain_handler/requirements.txt).

You should be able to run this from `cloud.mindsdb.com` starting next week. We will update this readme once it is possible!

## Instructions

1. Start MindsDB from the terminal with `python -m mindsdb`
2. Add the attached `monsters.csv` file through the `Upload file` button that can be found in the `Add` dropdown menu right above the SQL editor, to the left of the `Run` button. `Datasource name` should be `monsters`. Click `Save and Continue`.
3. In any editor tab, paste the commands found in the `commands.sql` file, then execute them sequentially. By the time you get to the `select` query, you will be able to see the agent's reasoning chain in the terminal logs. Note that the entire execution can take half a minute or so!
4. Experiment further :) We would love to hear your feedback (either in GitHub or our community Slack).
