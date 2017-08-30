# SEOlicous Rails Tools

never mind, this has to be out in shape and cleared up soon...

## what's it all about

In every project we face we have to handle serveral SEO tasks, and basically every page we build should be somehow shareable via Facebook/Twitter etc.
Also Google Analytics should be always in place, and of course, logged in admin users should not be tracked. 
thats where we start:
- tired of implementing the same GA source on every page?
- tired of checking OpenGraph and Twitter Tags on every page?
- tired of getting customer calls like "When i share page XY on facebook, the image is always streched/the title has a typo"

### why?
we mix up a few things from our 7+ years project experience and fork all the things that kept bothering us when it comes to SEO into one gem that we (EL digital solutions UG)
are sharing  across (almost) all our projects to make shure we can handle all our basic SEO setups for the projects we have easly

## Integration

This gem integrates flawlessly with ActiveAdmin
In order to set up the config just run `rake seolicous:install:active_admin`



# below this: IGNORE, it needs to be refined

### Info for users of AlchemyCMS
we started our entire work on a fork of AlchemyCMS about three years ago. At this point, thanks and props the entire [https://github.com/AlchemyCMS] team.
Even though the entire development has been going different paths by then, this plugin can still be easly integrated into an existing AlchemyCMS installation.
By default, if a `@page` variable is detected, the `#default_meta_title_and_description` will try to load the `#title` and the `#meta_description` attributes 
from the current page

### Info other default behavior
