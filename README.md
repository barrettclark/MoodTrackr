# MoodTrackr iOS APP

I don't always write Objective-C, but when I do I prefer to do it in ruby.

Using motion_data_wrapper for CoreData interaction


## Thoughts

Creating an app using RubyMotion is pretty easy.  Understanding the Objective-C
underpinnings helps a lot.  With this demo I tried to steer clear of wrappers
(add-ons) and go as bare-metal RubyMotion as possible.  The exception to this
was `motion_data_wrapper` for the CoreData interaction.

You still have to use XCode and create a dummy project to get the CoreData
data model, and you still have to use XCode to make new versions of the model.

Creating a simple 2-page app that persisted data to the database was a snap.

You can use storyboard if you need to for complicated interactions.  I didn't
need that here.

Having the complexities of CoreData somewhat mostly away, and being able to
write business logic in Ruby makes RubyMotion pretty killer.

## Bottom Line

I like it.
