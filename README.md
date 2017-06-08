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

Planbot uses [Postcodes.io](https://github.com/ideal-postcodes/postcodes.io/) to parse
user location data.

---

## Usage

Planbot is currently available on [Facebook Messenger](https://m.me/planbotco) and
[Slack](https://slack.com/oauth/authorize?scope=commands&client_id=162051889907.192270162849).
Planbot works within the guidelines of both platforms: a menu-based conversation
structure in Messenger alongside the use of commands in Slack for quickly querying
Planbot's database. This works well in minimising frustration common with chatbots,
as the bot's capabilities are clearly communicated to the user.

Planbot also has a public-facing API for handling direct requests to its database,
which listens at the <https://api.planbot.co/> subdomain.

Available actions:

| Action    | Function                          | Usage                      |
|-----------|-----------------------------------|----------------------------|
| `define`  | Return a definition               | `/define/term`             |
| `use`     | Use classes information           | `/use/class`               |
| `project` | Permitted development information | `/project/topic`           |
| `doc`     | Request policy or legislation     | `/doc/name`                |
| `lp`      | Request a local plan              | `/lp/area-or-postcode`     |
| `reports` | Request market research           | `/reports/location/sector` |

---

## Requirements and setup

* `python3 [v3.5.3]`
* `redis-server [v3.0.6]`
* `postgresql [v9.5.6]`

Further Python 3 requirements are accessible via `requirements.txt` *. You can
set up a development environment like so:

```
$ git clone https://github.com/ayuopy/planbot.git
$ cd planbot
$ python3 -m venv venv
$ source venv/bin/activate
$ pip install -r requirements.txt
```

You will also need to setup a test database. You can use `pg_restore` with the
supplied `src/components/data/planbot.SQL` dump file.

Be sure to add the absolute path of the components directory to your PYTHONPATH
to avoid issues with relative imports:

```
$ echo 'export PYTHONPATH=/path/to/components' >> ~/.bashrc
$ source .bashrc
```

\* note that `spacy` is memory intensive: at least 1gb of free disk space and
4gb RAM is recommended.

---

## APIs

### **engine**
```python
>>> bot = Engine()
>>> bot.response(user='123', message='GET_STARTED_PAYLOAD')
[{'id': '123', 'text': 'Hello! What can I help you with? Select an option from the menu to get started.', 'quickreplies': None}]
```

### **planbot**

Run `celery` worker with logging: `python3 planbot.py worker -l info`
```python
>>> pb = Planbot()
>>> # pb.run_task(action='reports', query='london', sector='commercial')
>>> pb.run_task(action='definitions', query='viability')
(('Viability', 'In terms of retailing, a centre that is capable of commercial success.'), None)
```

### **connectdb**

**`ConnectDB`**

Initialised with the name of a database table.

* **`query_response(context)`**

    Returns a dictionary consisting of text and quickreplies.

* **`query_keys()`**

    Returns an array of all keys in the initalised table.

* **`query_spec(phrase, spec=None)`**

    `spec` takes one of `'EQL'` or `'LIKE`', respective to
    different query types.

    Direct lookup using EQL returns a (key, value) tuple whereas
    indirect lookup using LIKE returns all keys matching `phrase`.

* **`distinct_locations()`**

    Returns array of unique report locations.

* **`distinct_sectors(location)`**

    Returns array of unique report sectors given a location.

* **`query_reports(loc=None, sec=None)`**

    Fetches report queries and returns an array of tuples. Depending on
    whether a location and sector is passed, different fields will be
    returned.

    If neither is given, all fields will be returned from the table.

    If only a location is given, reports of that location will be
    returned with fields sector, title, url.

    Lastly, if both are given, all reports matching the arguements will
    be returned with a title and url field.

* **`close()`**

    Close connection to the database.
