# Planbot

**Planbot is a UK property chatbot agent with a focus on planning.**

Planbot aims to provide users with a wide range of information. Currently, users can:
* Ask for a definition to over 750 terms
* Find out about different use classes and permitted development
* Request policy and legislation, including local plans
* Request market reports from industry sources

Sources used:
* Planning Portal
* Gov UK
* [*Lexicon of PRS, BtR & Property Terms*](http://www.richard-berridge.co.uk/prs-lexicon), Richard Berridge
* Savills
* Cushman & Wakefield
* Gerald Eve
* Knight Frank

---

## Requirements
* Python 3.5.2 (not currently backwards compatible with Python <=2.7)
* pywit
* bottle
* requests
* spaCy
* spaCy models (en, en_vectors_glove_md)
* python-Levenshtein

The chatbot uses the [Wit.ai](https://github.com/wit-ai/pywit) Python module to handle
responses. Wit.ai provides a method of Natural Language Processing (NLP) which aids in
selecting the right response to users' queries. As Wit.ai is in continual development,
Planbot may not be 100% accurate in selecting responses.

Another layer of NLP is provided by the spaCy module for Python3. This enables 
sentiment analysis of user responses when they request information such as definitions
or planning documents. As spaCy is computationally expensive it is recommended that 
the 'simple' version of Planbot is used in testing environments. This is enabled by 
default for the local client (see below). This module uses the Levenshtein distance 
algorithm to analyse string similarity, as such it cannot capture sentiment from user 
responses.

---

## Testing

**Planbot has an interactive client that you can run locally for testing purposes:** 

(Instructions are for UNIX-based operating systems - Python3 otherwise available [here](https://www.python.org/downloads/))

* Install Python3 and venv (through your package manager)
* Clone into the repo: `git clone https://github.com/ayuopy/planbot.git`
* Change working directory: `cd /path/to/planbot`
* Create a virtual environment using `python3 -m venv [name]` and
    activate it with `source [name]/bin/activate`
* Install dependencies:`pip install -r requirements-simple.txt`
* Run the Wit.ai interactive client: `python3 data/localbot.py`

`localbot.py` requires the `WIT_TOKEN` environmental variable to run. This is the 
recommended way to store the token, which provides access to the Wit.ai server where 
the natural language processing elements are stored. Feel free to ask for this access 
token.

This version of planbot uses the planbotsimple module by default. If you would like to 
test spaCy in the local client:

* `pip install -r requirements.txt`
* Switch `import planbotsimple as pb` to `import planbot as pb` in `localbot.py`
