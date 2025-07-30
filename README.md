# mertonR

A lightweight R wrapper for querying a remote [Ollama](https://ollama.com/) server (nicknamed *Merton*) using authenticated API access. Supports Gemma and other local LLMs via HTTP with bearer token authentication.

---

## 🚀 Installation

You can install the development version of `mertonR` directly from GitHub using:

```r
# install.packages("devtools")
devtools::install_github("thomas-u-grund/mertonR")
```

Or from a `.tar.gz` file:

```r
install.packages("/path/to/mertonR_0.0.0.9000.tar.gz", repos = NULL, type = "source")
```

---

## 🔧 Setup

Before using any functions, set your server URL and API key:

```r
library(mertonR)

set_merton_config("http://134.130.156.55:8080", "your-api-key")
```

This stores your configuration securely in a hidden file at `~/.merton`.

---

## 📦 Available Functions

### 🔍 `query_merton(prompt, model = "gemma3:1b")`

Query the model with a given prompt.

```r
query_merton("What is sociology?")
```

---

### 🛠️ `set_merton_config(url, api_key)` and `get_merton_config()`

Save and retrieve your server connection details.

```r
set_merton_config("http://your-server:8080", "my-secret-key")
cfg <- get_merton_config()
```

---

### 📡 `merton_status()`

Check if the server is reachable and running.

```r
merton_status()
# Returns: list(version = "0.9.6", ...)
```

---

### 📚 `merton_model_info()`

List available models on the remote Ollama server.

```r
merton_model_info()
# Returns: list("gemma:2b", "llama3:8b", ...)
```

---

## 📘 Example Workflow

```r
library(mertonR)

set_merton_config("http://134.130.156.55:8080", "your-api-key")

# Check server
merton_status()

# See available models
merton_model_info()

# Send a prompt
query_merton("What is sociology?")
```

---

## 🔐 Security

- API keys are stored locally in `~/.merton`
- All API calls use bearer token authentication
- Make sure your server is firewalled and properly secured if running over public IP

---

## 📄 License

MIT License

---

## 🙋‍♂️ Author

Thomas Grund  
RWTH Aachen University  
[github.com/thomas-u-grund](https://github.com/thomas-u-grund)
