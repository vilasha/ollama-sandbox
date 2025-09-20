# ollama-sandbox

A collection of standalone scripts, Jupyter notebooks, and other small tools that use [Ollama](https://ollama.com) and open-source LLMs.

## Prerequisites
All tools assume that Ollama is installed and that you have at least one model available.

1. [Download and install Ollama](https://ollama.com/download).  
2. Open **PowerShell** or **Command Prompt**.  
3. Pick a model from [Ollama Models](https://ollama.com/search).  
   - Models come in different parameter sizes (e.g. `3b`, `7b` for 3 billion / 7 billion parameters).  
   - Clicking on a model shows a table with the disk space required for each size.  
4. Run:
   ```powershell
   ollama run MODEL_NAME
- The first run downloads the model.
- Type `/bye` to exit.
5. List installed models:
   ```powershell
   ollama list
6. Remove a model:
   ```powershell
   ollama rm MODEL_NAME

## ai-commit
A Windows script that generates a Git commit message from your staged changes

**Usage**
1. In the script (line 28), set the model name to one you’ve already downloaded in Ollama
2. Copy the script into a folder listed in your system PATH (or add its folder to PATH)
3. By default, PowerShell blocks scripts. To allow it for the current session, run:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
4. From your Git project folder, run:
   ```powershell
   ai-commit
This will generate and print a commit command like:
   ```powershell
   git commit -m "Implement graceful shutdown for worker threads"
```
5. For you the up arrow key might work to recall the last command. For me it doesn't, so I just copy-past the generated
command, edit the message if needed, and hit Enter
6. Run ai-commit again to regenerate (subsequent runs are faster because the model stays warm)

## events-post-creator
A Jupyter notebook that generates posts for Twitter, Instagram and Facebook (all in Markdown) from content of a given
URL. Accounts for a language

**Usage**
1. Install ollama python package (either with pip or with PyCharm packages window or directly from the notebook)
2. Run all the cells, the output will appear at the bottom. Depending on your machine and the website might take from
1 to 4 minutes to execute the code