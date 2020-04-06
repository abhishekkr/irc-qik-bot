
## IRC-Qik-Bot

```
======================================================================
   ____  _    __       ___    ,, ,, ,,   ,,        ,,
    ||  ||)) // ' __  // \\_  || ||// _  ||       ====
   _||_ ||\\ \\_,     \\_//\\ || ||\\    ||)) (()) ||_

======================================================================
  IRC-Qik-Bot                                  version 0.0.1 beta
======================================================================
```

> can use [webchat.freenode](https://webchat.freenode.net/) to test out this bot

###  IRC ~ Automated Babbling Bot

*  How To Install:

```
$ gem install irc-qik-bot --no-ri --no-rdoc
``` 

*  How To Use:

```
## configure defaults for irc-qik-bot
WIP $ irc-qik-bot config

## directly starts at default channel
$ irc-qik-bot chat

## would join the provided server at default provided channel in config
$ irc-qik-bot irc.freenode.net

## would join provided server, channel  with default nick
$ irc-qik-bot irc.freenode.net, ruby

## would join with all provided config
$ irc-qik-bot irc.freenode.net, ruby, qbot

## configs can also be provided as ENV variables
$ IRC="irc.freenode.com" CHANNEL="#ruby" NICK="qbot" irc-qik-bot
```

> usage currently require the 'bot nick' to be used;
>
> will also pin it to conventional !command

### Current Features:

* basic IRC Network, Channel Connector
* Help             ~ 'qbot: help'
* Babbler          ~ 'qbot: babble'
* Quote            ~ 'qbot: quote'
* URL Un-Shortener ~ 'qbot: unshort http://SHORT_URL'
* google           ~ 'qbot: google search term'
* YAML Config Support


### Future Roadmap:

* whois
* nslookup
* ycombinator
* twitter
* reddit
* slashdot
* stackoverflow
* github

---
[@github](http://github.com/abhishekkr) | [@twitter](http://www.twitter.com/abionic)
---
