# Demo Chat Integration

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/anoldguy/vanilla-chatbot/tree/master)

Handle chat integrations with ease!

## Getting Started
TODO: Add copy about how integrations work, and how to set one up.

In the host app, type `!test help`.  You should see the following:

````
ping - Test if the endpoint is responding. Returns PONG.
help - Lists all commands with help
help <command> - Lists help for <command>
hello - Greets you by name!
date - Tells you what date it is.
````

Now, type `!test hello`, and you should see:
```
Hello, <name>!
```

## Integration Basics

Assuming user "Happy Camper" sent the command, the host app will POST to your
URL with the following data:
```json
{
  "command": "the command text",
  "metadata": {
    "callback_url": "https://3.basecamp.com/path/to/sending/chatroom"
    "creator": {
      "familiar": "Happy C.",
      "mentionable": "@happy"
    }
  }
}
