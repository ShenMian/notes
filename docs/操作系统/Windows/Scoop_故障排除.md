# Scoop 故障排除

## innounp-unicode

```
WARN  Purging previous failed installation of ollama.
ERROR 'ollama' isn't installed correctly.
Removing older version (0.2.3).
'ollama' was uninstalled.
Installing 'ollama' (0.2.3) [64bit] from 'main' bucket
Loading OllamaSetup.exe from cache
Checking hash of OllamaSetup.exe ... ok.
Extracting OllamaSetup.exe ... ERROR Exit code was 1!
Failed to extract files from D:\scoop\apps\ollama\0.2.3\OllamaSetup.exe.
Log file:
  D:\scoop\apps\ollama\0.2.3\innounp.log

Please try again or create a new issue by using the following link and paste your console output:
https://github.com/ScoopInstaller/Main/issues/new?title=ollama%400.2.3%3a+decompress+error
```

```ps1
scoop uninstall innounp
scoop bucket add versions
scoop install versions/innounp-unicode
```
