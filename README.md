##A Simple Demo##

This is a simple that mimics a kind of macro. If you type 'speak' or 'Speak' and then invoke SWFBridge quick assist (CMD+2), FDT will off your two things to replace it with.

###It shows....###
1. A simple example of hooking into FDT's plugin proposal list (CMD+2)
2. How to evaluate which proposal was chosen ( you can aslo assign different callbacks for each proposal )
3. How you can evaluate the context of the cursor. [You can use this to determine which (if any) proposals to show](https://github.com/alanklement/SimpleQuickAssist/blob/master/src/Main.as#L36-L39).
4. How to store a list of edites to a file ([look here, I'm only adding one but you can have as many as you want](http://goo.gl/UyNDA)). 
5. How to send / make a text edit to the file's model ([see here](http://goo.gl/hNBuB)).  
6. [How to work with line offsets](https://github.com/alanklement/SimpleQuickAssist/blob/master/src/Main.as#L45). This is how you tell the model where to add text and how much.

### This example is different from templates because... ###
This example is more about documenting how to use the API, not to demonstrate how far it can be taken. Once you understand what is going on, you start to realize the power.
With templates, you have no control over the context in which the text edit is either called or applied. It just plops down the text edit at the cursor offset and for the length of the text edit (template). There is no enforcement when you can / can't call a template. You can plop a template in the wrong place and break your code. 

Templates are also single shot. It just plops down text and that's it.

Now...suppose you wanted a 'smart' template that....

Depending on where I was (e.g. in a method body, is after a particular class declaration,  in a for loop, at the top of the file, at an import statement....), the template is different or doesn't show it self at all.
I want to have other things things happen after I select it. Suppose I want to organize and add imports as well.
Does more than just plop down code, perhaps it rewrites parts of the line I'm in - or even rewrites the line I'm at and pushes the old code into another method elsewhere.

### In Action ###

![Image](https://github.com/alanklement/SimpleQuickAssist/raw/master/demo/example1.png)

![Image](https://github.com/alanklement/SimpleQuickAssist/raw/master/demo/example2.png)

### Video ###

There is a video included in this repository [download it](https://github.com/alanklement/SimpleQuickAssist/blob/master/demo/demoplugin.mov?raw=true "Video") or checkout the repo and watch it.

### Sharing ###

If you want to share the plugin, other FDT developers will need to add your .SWF to the 'swfPlugins' folder. You can then activate it in the Swf Plugins menu.

![Image](https://github.com/alanklement/SimpleQuickAssist/raw/master/demo/example3.png)
![Image](https://github.com/alanklement/SimpleQuickAssist/raw/master/demo/example4.png)
