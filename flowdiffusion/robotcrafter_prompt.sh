#!/bin/bash

# Path to the action.txt file
action_file="/aifs4su/mmcode/worldm/RoboCrafter/prompts_custom/action/action.txt"

# Path to the Python script
python_script="train_mw.py"

# Base command options
mode="inference"
c_option="24"
p_option="/aifs4su/mmcode/worldm/RoboCrafter/prompts_custom/action/1_back.png"
g_option="2"
n_option="20"

# Check if the action file exists
if [[ ! -f "$action_file" ]]; then
  echo "Error: $action_file not found!"
  exit 1
fi

# Iterate over each line in the action.txt file
while IFS= read -r prompt
do
  # Run the Python script with the current prompt
  python "$python_script" --mode "$mode" -c "$c_option" -p "$p_option" -t "$prompt" -g "$g_option" -n "$n_option"
  
  # Check if the Python script ran successfully
  if [[ $? -ne 0 ]]; then
    echo "Error: The script failed for prompt: $prompt"
  else
    echo "Successfully ran the script for prompt: $prompt"
  fi
done < "$action_file"
