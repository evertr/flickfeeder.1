# Flickfeeder
## Git flow: 
1. Clone the repo  
`$ git clone https://github.com/andreacab/flickfeeder.1.git flickfeeder`  
2. On your local branch **master**, track corresponding remote branch  
`$ git branch -u origin/master`  
2. Create a **staging** branch  
`$ git checkout -b staging`  
3. On your local branch **staging** track corresponding remote branch  
`$ git branch -u origin/staging  
4. (Make sure you have `push.default=current` in your git config) 
```
$ git config --list
$ git config push.default current
```

Entering `$ git push` either on **master** or **staging** branch will push correctly to the right remote branch, **origin/master** and **origin/staging** respectively

## Deployment
- staging app: `$ git push` on your local staging branch automatically deploy to **heroku/flickfeeder-staging**
- prod app: `$ git push` on your local master branch automatically deploy to **heroku/flickfeeder**

## Links
- staging: [flickfeeder-staging](flickfeeder-staging.herokuapp.com)
- prod: [flickfeeder](flickfeeder.herokuapp.com)

## Development 
### Puma server
`$ puma -C config/puma.rb`

### Environment variables
- create `.env` file in your local repo and asks for keys and secrets. At time of writing, you should have the following:
```
DROPBOX_KEY=...
DROPBOX_SECRET=...
DROPBOX_KEY_DEV=...
DROPBOX_SECRET_DEV=...
HOST=...
```    

### Dropbox
- to test dropbox webhook (on OSX with python installed):
    1. Download the python script @ [Dropbox-webhook](https://blogs.dropbox.com/developers/2014/05/dropbox_hook-py-a-tool-for-testing-your-webhooks/)
    2. enter in the root of your dropbox-webhook folder the following:  
`$ python dropbox_hook.py notify http://localhost:<PORT>/dropbox/webhook --secret <DROPBOX_SECRET_DEV> --user <dropbox_user_id>`

### Redis
- install redis (use homebrew on mac)
`$ brew update && brew install redis`
- in one tab: 
`$ redis-server --requirepass flickfeeder`
- in an other tab: 
`$ redis-cli`
`$> AUTH flickfeeder`
`$> MONITOR` 
