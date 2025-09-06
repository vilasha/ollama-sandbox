# ai-commit.ps1
# Usage: add folder with the script into PATH env variable, run
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# ai-commit

# Check if in a git repo
if (-not (git rev-parse --is-inside-work-tree 2>$null)) {
    Write-Host "Not a Git repository. Navigate to a repo first"
    exit 1
}

# Get staged changes
$diff = git diff --cached
$diffLines = ($diff | Measure-Object -Line).Lines

if (-not $diff) {
    Write-Host "No staged changes to commit"
    exit 1
}

# If diff is too big, fall back to summary
if ($diffLines -ge 500) {
    Write-Host "Diff has $diffLines lines, using summary instead..."
    $diff = git diff --cached --stat
}

# Ask the model for a commit message
$commitMsg = $diff | ollama run llama3.2 `
"Generate a concise git commit message (one sentence, imperative mood). Do not add a period at the end. Output only the message."

# Normalize spaces and strip trailing whitespace (including Unicode)
$commitMsg = $commitMsg -replace "\p{Z}+$","" -replace "\s+$",""

# Print the ready-to-run git command
'git commit -m "{0}"' -f $commitMsg
