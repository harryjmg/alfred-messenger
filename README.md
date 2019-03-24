
# Alfred : The Flow Tester

Here is Alfred, the flow tester created by Harry Jmg.

## How it works
Linked to a Facebook page, Alfred will remember you on Facebook messenger to answer a few questions through a [Typeform.com](https://typeform.com) formular.

## What questions ?
The questions are my own original adaptation from the self made test "Mash-up HS du flow" published by hacking-social.com which is a mix from the ESM (experience sampling method by Mihaly Csikszentmihalyi) and the FSS-2 (Flow State Scale 2).

You can read about the article from hacking-social.com [here](https://www.hacking-social.com/2018/09/03/fl1-donner-des-sens-a-la-vie-la-piste-du-flow/).

## Why do you need to answer ?
The advantage of this method is to give you a fresh point of view on your own life without any judgement. You can read about the concept of Flow discovered by Mihaly Csikszentmihalyi and how to test it respectively [here](https://en.wikipedia.org/wiki/Flow_(psychology)) and [here](https://en.wikipedia.org/wiki/Experience_sampling_method).

If reading all these articles is too long for you. Just try it :)

## Configuration
The hard part is to connect your Rails app to your Facebook app. The facebook-messenger gem which Alfred is using has a [good documentation](https://github.com/jgorset/facebook-messenger#configuration) for that.

You also need to set a typeform webhook (if you want to use Typeform).

## To dev
Many things are still missing to make the app better...
 - [ ] **Unitary tests**
 - [ ] **Structure flow inputs per 7-10-14 days session** (better lisibility and UX)
 - [ ] **Paginate flow inputs**
 - [ ] etc etc...

 If you have any ideas for this list, I invite you to open an issue.

## Any questions ?
Feel free to open an issue or send me an email at harry.jmg@gmail.com

## FAQ
### Why Alfred ?
An old private joke for the viewers of [my youtube channel](https://www.youtube.com/channel/UC61GK_nOLSJdzAK5hoR2mJA) (french speaking).
