# Slack CLI

This repository is to be used when teaching students how to make Web-Api `POST` requests as part of the Ada Developers Academy [Ruby curriculum](https://github.com/ada-developers-academy/textbook-curriculum).  

To complete this lesson you will need a [Legacy Slack API Token](https://api.slack.com/custom-integrations/legacy-tokens).  The reason this application uses legacy tokens is to make learning initial `POST` requests as simple as possible, while remaining fun.  Other APIs, such as Twitter, require digitally signing Oauth1 requests, which is beyond the scope of the lesson.  

To run the tests you will need to generate a Slack token, and create a `.env` file in the root folder and add the following keys:

```
SLACK_TOKEN: <TOKEN_GOES_HERE>
CHANNEL_NAME: <THE_CHANNEL_NAME_TO_POST_TO>
```

## Possible Extensions


## Additional Resources

- [Slack API Docs](https://api.slack.com/)
- [HTTParty Gem](https://github.com/jnunemaker/httparty)
- [Webmock Gem](https://github.com/bblimke/webmock)
- [VCR Gem](https://github.com/vcr/vcr)
