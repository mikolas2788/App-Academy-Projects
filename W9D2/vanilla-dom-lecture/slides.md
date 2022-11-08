# Vanilla DOM Manipulation

Note:
+ **Good morning. Today is W9D1 and this is your Vanilla DOM Manipulation lecture.**

---

## Roadmap

* Ruby
* SQL -> ORM -> Active Record
* Ruby on Rails
* JS -> Vanilla DOM 🍦
* JQuery
* React/Redux

Note:
+ **We're past our halfway point of the program, so let's take a quick look at our roadmap. So far, we've covered Ruby. We've covered SQL, ORMs, and ActiveRecord, which brought us to Ruby on Rails. And now with that framework in our toolbelt, we've begun covering JavaScript. This brings us to Vanilla DOM today. Following Vanilla DOM we'll learn JQuery and then React/Redux, but before we do, look how far we've come in 8 short weeks. You should all be super proud.**

---

![corgi-uno](https://camo.githubusercontent.com/8c7e67ac86c74868dc2ce1a5b56cce6da376975c66d546288fb9b01ca5b1af44/687474703a2f2f332e62702e626c6f6773706f742e636f6d2f2d365237555455766e2d38772f5464473831345756664c492f41414141414141414a65772f596f716a42327239756a672f73313630302f62656c696576652e6a7067)

Note:
+ **So, to celebrate this milestone, here's a nice motivational corgi.**
+ **Before we dive in to Vanilla DOM, I want to ask that you please not try to memorize the DOM methods or attempt to get everything written down. There are so many methods available when it comes to Vanilla DOM and multiple ways to implement the same behavior, so attempting to memorize them has diminishing returns. Instead, starting today, it's the perfect time to start becoming more comfortable with looking at documentation, specifically the MDN docs. As we move forward this week, documentation will become invaluable to you.**

---

## Learning Goals

* DOM Manipulation
* Events
  * Event Handlers/Listeners
    * Bubbling and Delegation
    * `target` vs `currentTarget`
* Web APIs
  * `Document`, `History`, `Location`
* Vanilla DOM Manipulation <> jQuery
  
Note:
+ **So, here's a list of our agenda and some learning goals for today. Our main goal is to learn how to manipulate DOM elements using methods available to us through the DOM API. We also want to understand how to listen for events and how events are triggered. We also want to look at some other Web API functionality such as our History and Location objects.**

---

## What is the DOM?

* The `Document` is any web page loaded in the browser. This `Document` serves as an entry point into the web page's content, which is represented by the DOM. 

* A reference to the `Document` object exists as a property on the `Window` (i.e. `window.document`)

* DOM (Document Object Model) - A web API available for HTML, SVG, and XML documents
	* It allows programs to change the document structure, style, and content. 
  * The DOM represents the document using nodes and objects to represent the structure of our document (think family tree).

Note:
+ **So, what is the Document Object Model? It is a web API and with programming languages like JavaScript, we can use it to manipulate the contents of our document or web page. The Document Object Model is represented as a virtual tree and each branch of the tree will end in a node. Each one of those nodes represents an HTML object. So in a sense, our DOM is an object-oriented way to represent our web page and all of its content.**
+ The W3C DOM and WHATWG **The standards around the DOM are implemented in most modern browsers. Many browsers will actually extend the standard or rules of the DOM, so we should exercise care when using them on the web where documents may be accessed by various browsers with different DOMs.**
+ **For our purposes, the HTML Document Object Model is a standard object model and programming interface for HTML. It defines: all HTML elements as objects, the properties of all HTML elements, the methods to access all HTML elements, and the events for all HTML elements. So what does that really mean? Essentially, the HTML Document Object Model is a standard for how to access, change, add, or delete HTML elements on our document or web page.**

+ MAYBE: Types of docs:
  + XML was designed to carry data - with focus on what data is
  + HTML was designed to display data - with focus on how data looks
  + XML tags are not predefined like HTML tags are
  + XML simplifies data sharing, transport, availability, and platform changes

---

## DOM Manipulation and JavaScript

* DOM manipulation allows us to use plain JavaScript to perform CRUD operations on the objects on our webpage. Any changes are reflected in the display of the document.

* Different browsers have different implementations of the DOM, with varying degrees of conformance to the W3C DOM standard, but every web browser uses some document object model to make web pages accessible via JavaScript.

Note:
+ **Let's talk a bit about DOM Manipulation and JavaScript then.**
+ **When we say 'vanilla DOM', we are referring to using plain JavaScript. No frameworks, no libraries. Just plain ol' JavaScript to manipulate our DOM elements. Out of that, the core DOM defines the objects that fundamentally describe a web page and the objects within it with JavaScript. All of the properties, methods and events available for manipulation are organized into components of the DOM. For example, the `document` object that represents the web page itself or the table object that implements the special HTMLTableElement DOM interface for manipulating HTML tables. We can access and leverage these with simple JavaScript.** 

---

![DOM](https://upload.wikimedia.org/wikipedia/commons/5/5a/DOM-model.svg)

Note:
+ **Here we have a diagram of our DOM when it comes to an HTML webpage, As we can see, this DOM tree starts with our document object. This object represents our actual web page. And its first child is our root element, the actual `<html>` element that contains all of our webpage's HTML code. And this branches out to our `<head>` and `<body>` HTML elements and all of their nested HTML elements. Every one of these is a node and some are parents and some are chidren. Again, this makes up our DOM tree because everything is connected.**
+ **Also, please notice that the actual text content of an `<h1>` tag or the `href` attribute of an `<a>` tag are also represented as node objects in our DOM tree. This is beneficial for us as we can then directly access these properties.**

---

## Data Types 

* `Node` - Every object located within a document is a node of some kind. 

* `Element` - Refers to an element or a node of type element returned by a member of the DOM API.

* `NodeList`- A nodeList is an array-like collection of nodes and can be accessed through indexing.

* `HTMLCollection` - A HTMLCollection is an array-like collection of elements

Note:
+ **Here we have some data types in our DOM:**
+ READ THE SLIDE
+ **With each of these data types, there are additional interfaces that you can use in conjunction with the standard DOM interface. There are a lot of avenues available to you.**
+ **And again, remember that every object in our tree is a node of some kind, so we can have HTML element nodes, a document node for our web page itself, nodes for our attributes, and nodes for our HTML element's text.**

---

## DOM Manipulation Methods 

* `.getElementById(idString)` - Returns the HTML element of given Id

* `.getElementsByClassName(classString)` - Returns Collection of HTMLElements with the given class

* `.querySelector(selector)` - Returns first element of given selector

* `.querySelectorAll(selectors)` - Returns NodeList of matches
	+ selectors can be tags(div), classes(.hidden), ids, and combined(h2#TOP > p)

Note:
+ **Here we have some simple DOM manipulation methods that we can use to access objects in our DOM tree.**
+ **First we have `.getElementById(idString)` and `.getElementsByClassName`. Note that the first returns an HTML element of that given id on our web page while the second returns an array-like collection of HTML elements of that class. There are a variety of other methods that return HTML elements and collections as well.**
+ **After those, we also have `.querySelector()` and `.querySelectorAll()`. Both of these take CSS selectors like an element type, class or id as arguments. Also note that the first returns the first element that matches that selector. The second returns an array-like NodeList of elements that match those selectors.**

+ **The two `querySelector` methods can accept one or more comma-separated selectors to determine what element or elements should be returned.**
+ **Also, take note that the first two methods return an HTMLCollection and those collections are live. From last night's homework, we know that those live HTMLCollections will continue to update if I make changes to those HTML elements in them or add new HTML elements that satisfy their check.**
+ **The second two methods return a Node element or NodeList, and these are not live. This means that changes in our DOM are not reflected in the NodeList that is returned when these are invoked.**
+ **Lastly, between a NodeList and an HTMLCollection, we can call forEach on a NodeList, but not for the latter. We can also index into these two, but most array methods do not apply to them.**

+ **Let's try demoing some of these in our Chrome DevTools.**
+ Open dev tools on slide.
+ **So I have a few paragraph elements on this page, so let's try collecting some of them in a NodeList with my `.querySelectorAll` method.**
+ Add `document.querySelectorAll("p");` in console.
+ **As we can see, this is a NodeList, which is array-like and it contains all of my bullets as Node objects.I can also use my `getElementsByTagName` method to collect these paragraph elements.**
+ Add `document.getElementsByTagName("p");` in console.
+ **This collection is no longer a NodeList though. It's an HTMLCollection. Again, HTMLCollections are live while the NodeList from earlier would be static. With that, let's try picking the first paragraph element as well with my `.querySelector` method.**
+ Add `document.querySelector("p")` but don't enter it.
+ **We can see that I'm highlighting that first paragraph element using this method, let's try and add some new styling to it.**
+ Finish `document.querySelector("p").style.color = "red";` and execute it. The first paragraph should turn red.
+ **And look at that, we've actually changed our web page via JavaScript in the console. That's some simple DOM manipulation for you.**


+ Additional DOM Methods
+ `document.querySelector()` vs `element.querySelector()`;
  + `document.querySelector()` returns the first Element within the document that matches the specified selector, or group of selectors. If no matches are found, null is returned.
  + `element.querySelector()` of the Element interface returns the first element that is a descendant of the element on which it is invoked that matches the specified group of selectors.

+ `document.getElementsByClassName()` => returns an HTMLCollection and is live
+ `document.getElementsByTagName()` => returns an HTMLCollection and is live
+ `document.getElementsByName()` => returns a NodeList and is live
+ `Node.childNodes` => is live, NodeList
+ `document.querySelectorAll()` => returns a NodeList and is NOT live

---
## DOM Styling Methods

### Inline
* element.style.property = "value" => inline sets property to given value 				 
    * `div.style.display = "none";`
    * `p.style.fontWeight = "900";`
### Class
* element.classList => return array-like Object of classes for the element

* element.classList.add(class) => adds a class to given element

* element.classList.remove(class) => removes class  

Note:
+ **Here we can see a few methods to go about styling our DOM elements.**
+ **First, we can specifically set the inline styling of an HTML element through DOM manipulation and the style method.**
+ **We can also go about adding or removing a specific class from an HTML element through DOM manipulation as well. If we had a predefined style for that class, then we could toggle that styling for an HTML element. Also, note that our `.classList` method returns an array-like object of that given element's current classes.**

---

## Events and the DOM

* An event can be something the browser does or something a user does.

* Examples:
	* A web page has finished loading
	* An input field was changed
  * A button was clicked
  
* JavaScript code can react to these events via event _handlers_ or _listeners_ installed on DOM elements.

+ [Super quick and painless list of web events](https://developer.mozilla.org/en-US/docs/Web/Events)

Note:
+ **So, what is an event? Simply put, it's some type of change or interaction that can occur in our web page because of the browser or our user. Here we have some examples of events. If a web page finishes loading, if someone changes the text inside of an input field, and maybe the most simple: a button click. These are all events.**
+ **So like the slide says, we can write JavaScript code that listens for these type of events and then run some kind of reaction when those events occur. We can do so with event handlers and listeners and we can install these on our actual DOM elements.**

+ **We have some documentation on web events here as well.** Navigate to link. Scroll down and display how many types of web events exist. **There's a wide variety of web events, but the most recognizable might be the mouse click.**

---

## Event Listeners

* There are 3 ways to register event handlers for a DOM element.
	* On an event target element using `EventTarget.addEventListener()`*
  * On a HTML attribute `<button onclick="alert('Hello world!')">`
  * DOM element properties `myButton.onclick = function(event){alert('Hello world')}`

Note:
+ **So, again, we can set our web page to listen for certain interactions or changes and we can do so with Event Listeners**
+ **There are three ways we can set event listeners. The first is to use our DOM to actually access our HTML element that should listen for some type of interaction and then use our `.addEventListener` method on that object.**
+ **We can also set an inline event type attribute in our actual HTML code that points to the code we want to execute. We can see an example here with our onClick listener that raises a browser alert.**
+ **Finally, we can utilize our DOM again to access a specific HTML object and then set its event type property to the code we want to execute.**

+ **Overall, the first is the most preferred here. The second is also quite discouraged because it reduces code readability. It also doesn't separate the behavior from the actual code's structure, so it would make bugs harder to find.**

---

## When using `.addEventListener` 
* `change`: An HTML element has been changed
* `click`: The user clicks an HTML element
* `mouseover`: The user moves the mouse over an HTML element
* `mouseout`: The user moves the mouse away from an HTML element
* `keydown`: The user pushes a keyboard key
* `load`: An object has been loaded.

Note:
+ **So, how do we implement an Event Listener?**
+ **If we were to use our `addEventListener` method, it will take two arguments. The first argument is an event type and the second an event handler callback. These are all event types that we can set our Event Listener methods to listen for. We can listen for HTML changes, click, mouseover, mouseout, and keydown interactions. We can even listen for loading of an object. These would all serve as the first argument in our `.addEventListener` method.**

---

## Directly on an html element 
* `onchange`: An HTML element has been changed
* `onclick`: The user clicks an HTML element
* `onmouseover`: The user moves the mouse over an HTML element
* `onmouseout`: The user moves the mouse away from an HTML element
* `onkeydown`: The user pushes a keyboard key
* `onload`: An object has been loaded.

Note:
+ **If we were to use our less preferred method of writing inline listener attributes for our HTML elements, the key-value attribute would consist of an event type key and then point to the callback value we want to execute. These are all examples of event type keys we could set directly on an HTML element. Again, these all correspond to the event types from our previous slide.**

---

## DOM Manipulation Demo

Note:
+ **So, now that we have more methods at our disposal, let's try using DOM manipulation in our demo.**
+ Open up `index.html` in the browser and also open up `index.js` and `index.html` in VS Code.
+ **As we can see here, we have a Weekly Meal Planner. It can accept Grocery items we want to eat and should then add those to our Grocery List. It can have a random list of recipe ideas and also keeps track of the current week's recipe that we've chosen. If our web application was larger, we might add more information about our specific recipes below our classic Lorem Ipsum sections at the bottom.**
+ Navigate to `index.html`.
+ **If we look at our actual HTML structure for this web page, we can see that I'm sourcing my `index.js` file. This is where we'll end up writing our vanilla JavaScript. Below that, we also have all of our page's sections: our grocery form, our This Week's Recipe heading, our actual unordered grocery list, and finally our list of random recipe ideas.**
+ Navigate to `index.js`.
+ **So, to make this web page functional, we can write some JavaScript in this file. The first thing we should do is access our groceries list which is empty, our grocery form which accepts a new item, our random recipe list, and the actual heading for the week's recipe.**
```js
//grab the dom elements we need (groceries, grocery-form, recipe-list, recipes)

//so, again, we want to gather the dom elements that we need:
//I think I can use my querySelector method for all of these because I'm grabbing individual HTML elements and I can do so by their unique classes.
// In my html file, my groceries list has a class of 'groceries', so let me pass that class as the argument to my querySelector and save it to a variable.
const groceriesList = document.querySelector(".groceries");
// Note my use of the . to indicate I want the first html element with the class of groceries. If I were looking for an element with a specific id I would use a hastag instead.

// After that, I can simpy grab the rest of what I need via their classes as well. The grocery form's class is grocery-form.
const groceryForm = document.querySelector(".grocery-form");

//The recipe list's class is recipe-list.
const recipeList = document.querySelector(".recipe-list");

//And the week's recipe header's class is recipes.
const recipes = document.querySelector(".recipes");

// Again, I've gone ahead and accessed these actual HTML elements with my querySelector method and saved them to semantically named JavaScript variables.

// Besides those variables, we're going to need to keep track of all of our groceries and recipes somewhere. For this web page, we don't have a database to store our user input though. Instead, we'll use our localStorage. 

//Our localStorage is an object that we can interface with on our browser web page's window and we can store JSON data there for the purposes of this demo. You can sort of think of it like a cookie.

const lsItems = JSON.parse(localStorage.getItem('items')) || [];
const lsRecipes = JSON.parse(localStorage.getItem('recipes')) || [];

// For my lsItems and lsRecipes variables, I am just checking my localStorage object for values under the keys of 'items' or 'recipes' respectively. I am then parsing those stored JSON strings into arrays so I can handle that data in JavaScript.
// There are some resources from last night's readings regarding localStorage, but the main takeaway here is just that I will be saving my data as JSON in my localStorage and pulling it back and parsing it from there.
```

+ **Now that we've accessed these HTML elements and have explored how we'll use our localStorage object, let's see if we can go about creating an event handler callback to add grocery items to our grocery list.**

```js
//---------------PHASE 1 DOM MANIPULATION DEMO-----------------//
//create event handler that adds to our grocery list

// So, we have our general callback structure defined for us already; it's been named addItem and as we can see, it takes in an event as an argument.
const addItem = (e) => {
  // So this addItem callback will correspond to my Add Item submit button on my grocery form. Any time that submit button is clicked, this event handler should be invoked. Because HTML forms will attempt to submit a new HTTP request by default, I can stop this behavior by taking my event variable and calling my preventDefault method on it. This stops that default behavior and allows me to control the flow of data.
  e.preventDefault();

  // With that in place, let's access my web page's input form where my users will type in new grocery items and submit them.
  
  // NAVIGATE TO index.html AND GO TO grocery-form

  // If we look at my HTML file, we can see that it's a text input with a name attribute of "add-grocery". It just so happens that I can leverage that input tag type and its name attribute with my querySelector method to access that DOM object.
  let input = document.querySelector("input[name='add-grocery']")
  // Again, I've passed the input tag type and specified that I want the input tag that has a name attribute with a value of 'add-grocery'. This should locate that text input in my DOM tree and allow me to save that HTML input tag as a DOM object in my input variable.

  // With that DOM object saved to a variable, we can access the actual text inside of my input tag with my DOM value method too:
  let value = input.value;
  // Note that I'm saving that text to a variable.

  // And now that we have the actual text the user added, let's go ahead and format this before adding it to my localStorage object:
  const item = {value: value};
  // Here I am just organizing each grocery item's name under a key of value.

  // Now I can grab the lsItems array we constructed by parsing my localStorage and push this item object into it.
  lsItems.push(item)

  // After that, I'll then just reset the key-value pair within my localStorage object to my new lsItems array after converting it to JSON
  localStorage.setItem("items", JSON.stringify(lsItems));

  // Awesome, we have now persisted that grocery item input to our localStorage object. With that done, I can now reset my groceryForm DOM object using my DOM reset method. This method will reset all of the values of a form HTML element to their defaults.
  groceryForm.reset();

  // I can also now take my localStorage information and update my groceriesList DOM object with it. To do so, I'll make a call to a method we haven't written yet, updateList:
  updateList();
  // Again, I still need to write this method, but it should take my localStorage grocery information and update my groceriesList DOM object.
}
```

+ **Let's try writing the updateList method now, so we can render our groceries list items via DOM manipulation.**

```js
//create action to render grocery list items

// Again, I have my structure predefined for me:
const updateList = () => {
  // So, we have two options now. For the first one, I can choose to take each grocery item from my lsItems array and insert a string html element for each one. As for the second option, I can opt to create individual html elements and add them using built-in DOM methods.

    // method 1: using string html element
    // Let's start with the 1st method. We can first access our grocery list through the DOM element variable I selected earlier. That element is an unordered list tag, so I can call a DOM method known as innerHTML to set its li tags for it. For what I want to set as its innerHTML, I think I can map across my lsItems array, take each item element, which is an object, and return an li tag string for each value:
    groceriesList.innerHTML = lsItems.map(item => {
      return `<li>${item.value}</li>`;
    })
    // Note that I am literally returning a string li tag with each item's name value interpolated inside of that string. My innerHTML method will do the hard work of turning those string li tags into actual li tags and nesting them inside of my groceriesList DOM element.
    // Let's try creating individual DOM elements as well though.
   
    // method 2: using document.createElement
    // So first I can call my DOM method createElement and pass in a string of li to let it know that I want to create an li tag and then save that to a variable:
    let li = document.createElement('li');

    // I can then access that li tag's innerText via the DOM innerText method and set that equal to the last value my user input added to my lsItems array. Remember, my lsItems array will just keep track of new grocery items as my user's submit them.
    li.innerText = lsItems[lsItems.length-1].value;
    // At this point, we have an li tag with the new grocery item's name value inside of it, so we can simply add that to our unordered groceriesList DOM element. To do so, I can use my DOM appendChild method and pass in that li object.
    groceriesList.appendChild(li);
    // As I submit each new groceryItem, this will nest a corresponding li tag within my groceriesList DOM element.
}
```

+ **Awesome, we've got a event handler callback for adding grocery items and now a method for updating our groceriesList as well. I feel like I'm forgetting something though. What am I missing?**
+ Event Listener
+ **I have my addItem event handler, but this won't do anything if it doesn't have an event to trigger it. So, let's go ahead and write our event listener that will actually listen for a form submission and then invoke it:**
+ Scroll down.

```js
//add event listener to on submit for form to process add item

// Again, I want to listen for a form submission, so if someone hits my grocery form's submit input, my event listener can then invoke my addItem callback, which will take their text input, add it to my localStorage, and then update my actual groceriesList.
// So let's take my groceryForm DOM element and add an event listener to it. it should listen for a "submit" event type and invoke my addItem callback:
groceryForm.addEventListener("submit", addItem);
```

+ **Awesome, let's try testing this out then!**
+ Test out your web page's add item. Hopefully it works. If not, double check your code.
+ **We're now adding items to our grocery list and rendering those changes via DOM manipulation.**

+ If 60-90 minutes into lecture, take a 5-10 minute break.

+ **Now, that we have grocery items on our groceriesList, let's see if we can add another event handler that allows us to cross out our grocery list items when clicking on them. If I'm picking up my groceries I want to be able to keep track of that, right?**
```js
//create event handler to cross out list items on click

// We can go ahead and utilize this prewritten structure. We'll call this event handler: markAsDone.
const markAsDone = (e) => {
  // So inside of this event handler, I do have access to the event variable, e, that this callback takes in.
  // I can use this event to leverage what HTML element has just been clicked.

  let ele = e.target;
  // Again, this event handler function will take the event this callback corresponds to (in our case a click) and store the click event that triggered the event handler. So I can access the HTML element that triggered this event by using my target method on my event variable.

  // Now that I have my HTML element which should be a grocery list item, I can cross it out with css styling. I happen to have that styling predefined in my style sheet under a class of 'done'.

  // NAVIGATE TO style.css AND SHOW .done STYLING

  // So, to add and remove that styling, I can use both my classList method and toggle method to add and remove that class from the element I have clicked:
  ele.classList.toggle('done');
  // Again, upon clicking a grocery item, this should set that item as my event target and then toggle this class to cross it in or out.
}
```
+ **Awesome, we have our event handler callback, but again, we still need to set up an event listener that actually listens for list item clicks, right? Let's add that now.**
+ Scroll down.

```js
//add event listener to cross out a list item

// Again, I want to listen for a click of a grocery list item, so if someone does so, my event listener can then invoke my markAsDone callback, which will take that list item li and give it the appropriate styling to cross it out.
// Let's see if I can just add an event listener to my actual groceriesList DOM element and take advantage of bubbling.
// So let's take my groceriesList DOM element and add an event listener to it. It should listen for a "click" event type and invoke my markAsDone callback:
groceriesList.addEventListener("click", markAsDone);
```

+ **Let's give this a test.**
+ Test out your web page's markAsDone. Hopefully it works. If not, double check your code.

+ **Awesome, we can now add groceryItems and cross them in and out if we do or don't have them.**
+ If 60-90 minutes in, take a break. **Let's go ahead and take a 10 minute break. After, we'll return to the slides!**

---

## Problem

* Let's say that we have a parent element with several child elements
* Let's also say that something needs to happen when each child element is clicked
* You could add a separate event listener to each individual child element, but what if the child elements are frequently added and removed?
* Adding and removing event listeners would be a _nightmare_

* Additionally, event handlers can potentially cause memory leaks and performance degradation — the more you have, the greater the risk.

Note:
+ **Now that we've added an event listener to our groceries list that affects individual list items, let's talk about a hypothetical problem we might see down the line.**
+ **What if we had a parent element with multiple child elements and something needs to happen when each child element is clicked. Sound familar? We just encountered that scenario. So while we took advantage of bubbling, we could add separate event listeners to each child element. However, what if the child elements are frequently added and removed? That'd be horrible. Plus, it's just not efficient to structure our code this way. As the slide says, it's risky and performance wise quite bad.**
+ **What's our solution?**

---

## Solution: Bubbling and Event Delegation

* Avoid adding event listeners to specific nodes

* Instead, the event listener is added to a common parent.

* Bubbling Principle: after an event triggers on the deepest
possible element, it then triggers on its parents in nesting order.

* The event listener analyzes bubbled events to find a match on child elements.

Note:
+ **Again, you've probably heard me mention bubbling at this point, but now we'll talk more about it. Our solution for this issue is bubbling and event delegation. With these two concepts, we can avoid adding individual listeners to repeated nodes. Again, we already took advantage of it when designing our markAsDone callback and the click event handler on our groceriesList.**

+ **So to review, our bubbling principle is that after a user makes a click, it will ripple all the way up to the top of the DOM tree and trigger similar events on all of the parent elements. We might not see some of these clicks because some elements aren't listening for click event types, but this bubbling up still happens in the background.**

+ **So instead, we can place an event listener on a single parent HTML element that nests multiple children elements and that event listener will get executed if that event is executed on any of the child elements.**

+ **This is event delegation. We can think of it as responsible parents and negligent children.**

---

![delegation1](https://camo.githubusercontent.com/ef44aa0598f0b02aecc24d5ac2427f07f1f8e283ceb13af26d649ccfef9fd297/687474703a2f2f7777772e6a61766132732e636f6d2f426f6f6b2f4a617661536372697074496d616765732f6576656e74427562626c652e706e67)

Note:
+ **Here we can see a simple diagram of the bubbling principle. If we click our deepest nested div element, then that click will bubble up all the way to our document node.**

---

![delegation2](https://camo.githubusercontent.com/2f3a74cd395c2e27fe9882dce68c422ef6cb9395c4b6313bca7ac4c1004f588c/687474703a2f2f73332e616d617a6f6e6177732e636f6d2f33376173736574732f73766e2f3834352d627562626c696e672e706e67)

Note:
+ **Again, here's another diagram displaying this process. In this case, a mousedown event will bubble up from the list element with a class of todo up to the article element with a class of todolist and then a div element with a class of project. If either of those parent elements have mousedown event listeners, then those would be triggered.**

---

### Target vs currentTarget

1. `Event.target`: A reference to the _specific_ object where the event occured. This object "dispatched" the event.


1. `Event.currentTarget`: A reference to the element on which the event handler has been attached. As opposed to `event.target` which identifies the element on which the event occurred.

Note:
+ **Following bubbling and event delegation, let's talk a bit about target vs currentTarget.**

+ **We know when we listen for an event, we have our target and currentTarget available to us from our DOM. Our `Event.target` is a reference to the specific object or HTML element where the event occurred. This could be a click or scroll over. The target will just be the specific DOM element that dispatched the event itself.**

+ **Our `Event.currentTarget` is a reference to the object or element on which the event handler (that was triggered by the event) has been attached. Again, this can differ from our `Event.target` where the actual event occurred due to our bubbling principle in the DOM tree. We could click a button and due to bubbling, a parent div's event listener could be triggered due to that. In that case, the target would be the button, but the currentTarget would be the parent div.**

---

## Event Delegation Demo

Note:
+ **Let's jump back into our demo to see Event Delegation and work with bubbling.**

+ Navigate to `index.js` and scroll down to event listener section.
+ **To experiment with bubbling, I'll first comment out this event listener that invokes our markAsDone event handler.** 
+ Comment out groceriesList event listener for markAsDone. Then scroll down to Phase II section.

+ **So, at this point, instead of using event delegation, I could opt to add click event listeners to all of of my grocery list items. If any of these grocery list items were clicked, they would invoke their event listener's respective markAsDone callback to cross that list item out.**

+ **As we can see here, I have some code already built for us. Let's walk through it. First, we querySelect all li elements nested in my ul with a class of 'groceries'. This will return a NodeList of all of my grocery items in my groceriesList ul.**
+ **I then iterate through that NodeList with a forEach loop. Now, answers in the chat please: my NodeList is array-like,  but can I use a forEach with it?** Yes. **How about an HTMLCollection?** No.
+ **So, as I iterate over each grocery item, I can add a click event listener that accepts my markAsDone callback. Again this is not the DRYest code, but it will get the job done.**
+ **Now, if I click any grocery item, it will cross out that grocery item on my webpage. However, due to bubbling, we know that that click event will travel all the way up my DOM tree. What if a parent element was listening for a click event too?**

+ **If we look below, we have an event handler callback called `boo`, which triggers a browser alert with a "Boo" message. And below that, our grocery list items' parent element, our groceries unordered list, just so happens to be listening for a click event as well and it will trigger our `boo` callback as a result. Let's test this out in our browser.**

+ Add a grocery item and attempt to cross it out. It should open an alert.
+ **As we can see, the click event on my grocery list is triggered even though we clicked the grocery list item. Our alert was raised when we didn't want that to happen. This is the downside of our bubbling principle. Sometimes, we don't want to allow bubbling.**

+ **How can we solve this though? Well, we can add a simple line in our `markAsDone` callback:**
```js
const markAsDone = (e) => {
    // Before any of my toggling, I can take my click event that is passed to this callback and explicitly tell it that it should not bubble up to any parent elements. How? With my stopPropagation method:

    e.stopPropagation();
    // This method will stop my event from bubbling up and as a result, my groceriesList's click event listener should not be triggered.

    let ele = e.target;
    ele.classList.toggle('done');
}
```

+ **Let's try testing this out.**
+ Add a new grocery item. Then open your console.

+ BEFORE CROSSING OUT THAT ITEM, TAKE NOTE THAT YOU WILL NEED TO RUN THE BELOW LINES IN YOUR CONSOLE AFTER ADDING A NEW GROCERY ITEM:
```js
groc = document.querySelectorAll(".groceries li")
    
groc.forEach((child) => {
    child.addEventListener("click", markAsDone);
})
```
+ ONLY REASON TO DO THIS IS BECAUSE YOUR groc VARIABLE WILL BE EMPTY TO BEGIN WITH BECAUSE IT IS NOT LIVE COLLECTION. YOU NEED TO RUN IT AGAIN TO GET THAT NEW GROCERY LIST ITEM ELEMENT.

+ Try crossing out your item. Hopefully it works. If not, explain that it's not adding the markAsDone handler to your grocery items because the list isn't a live collection. 

+ If it does work: **Awesome, we're crossing off our grocery items and our alert isn't being triggered. This must mean our event isn't bubbling up our DOM tree.**

+ **Any questions?** If not: **Let's take a 5 minute break.**

---

## Web APIs

* Web APIs are APIs for either a web server or a web browser.

* Web APIs are typically only accessible from the application's client-side.

* [MDN's List of WEB APIs](https://developer.mozilla.org/en-US/docs/Web/API)

Note:
+ **So, let's talk a bit about Web APIs. We know that that an API is an Application Programming Interface. How does this relate to our website. Well, the slide says it all. They serve as interfaces for our server or even our browser. They're also typically accessible from the app's client-side. In our case, when we open up our browser, we might have some interaction with a Web API.**
+ **We do have a link here to some Web APIs as well, so let's take a quick look.**
+ Open https://developer.mozilla.org/en-US/docs/Web/API
+ **As you can see, there's a fair amount of Web APIs out there. You might notice Canvas listed here. DOM definitely stands out as well.**

+ **So, why are we talking about Web APIs? Mainly because we have a few useful ones that can be accessed via our Window interface.**
+ **The `window` interface is a perfect example of a useful Web API as it includes methods and properties that need to be globally available. Let's dig into it a little more.**

---

## History

* The `window.history` read-only property returns a reference to the `History` object

* The `History` object provides an interface for the browser session history (pages visited in the tab that the current page is loaded in).

* There is no way to clear the session history or to disable the back/forward navigation from your code.

Note:
+ **So, what is our History? Well, our window interface happens to possess a history property. And this property references our `History` object which is provided by our `Window`. This `History` object gives us an interface for our browser's session history. It's going to contain the URLs visited by the user in our browser window. With it, we can keep a record of all web pages we've visited and our current page.**

---

## History methods

* Moving backward and forward through the user's history is done using the `window.history.back()` and `window.history.forward()`.

* You can also use the `window.history.go()` method to load a page identified by its relative position to the current page (with the current page being relative index 0).

  * (i.e. `history.go(-4)` goes back 4 pages.)

* You can determine the number of pages in the history stack via `window.history.length`:

Note:
+ **With this in mind, let's talk a bit about History methods.**
+ **For our History object, we can navigate our visited web pages via our `back` and `forward` methods. These do exactly what they sound like. They allow us to essentially travel from web page to web page in our History object's stack.**
+ **We can also implement our `go` method to visit a specific page in our History. Note that our current page has an index of 0 in our History object, while we utilize negative numbers to travel back.**
+ **Also, take note that we can call a `length` method on our History object to see how many recorded pages exist in our History stack, which is an array.**

IF TIME PERMITS:
+ **Lets try demoing some of our history commands in our window's console.**
+ window.history.back()
+ window.history.forward()
+ window.history.go(-2)
+ window.history.length

---

## Location

* The `window.location` property returns a reference to the `Location` object.

* The `Location` object contains information about the current URL.

Note:
+ **Now, let's talk a little bit about Location.**
+ **Again, our Window API has a `location` property that returns a reference to our API's Location object. This object stores information about our current page's URL.**

---

## Navigating with Location

* To go to a page all of these are equivalent
	* `window.location.assign(url);`
	* `window.location = url;`
	* `window.location.href = url;`
  * `window.document.URL` (READ ONLY)

Note:
+ **When it comes to navigating with your window's Location, there's some flexibility. As we can see here, we have multiple different techniques that allow us to add a URL to our Location object and navigate to that URL.**

+ **Let's try demoing these briefly.**
+ Open tab and add: window.location.assign("https://www.google.com");
+ Open tab and add: window.location = "https://www.twitter.com";
+ Open tab and add: window.location.href = "https://developer.mozilla.org";
+ Open tab and add: window.location.replace("https://www.google.com");

---
## Anchor 

* "#" comes at the end of the url
* it looks for ids with whatever string comes after the "#"
* if it doesn't find any then nothing happens

* if it does then it takes the page and anchors it to that html element

* [ActiveRecord docs](https://guides.rubyonrails.org/active_record_basics.html)

Note:
+ **So, what is Anchoring? Anchoring is an API that allows us to leverage our URL against html elements and their ids. Essentially, an anchor link is a special URL that takes you to a specific place on a web page. They're otherwise known as "page jumps".**
+ **As our slide says, our URL can be followed by a hashtag. And whatever string follows that hashtag can be used as an anchor if it corresponds to an id in one of our web page's HTML elements.**
+ **If the id doesn't exist in your html, then nothing happens. If it does, then it will anchor your page to that HTML element.**

+ **Let's see this in action with our ActiveRecord docs.**
+ Open https://guides.rubyonrails.org/active_record_basics.html
+ Navigate down to the Create section and examine with dev tools. Highlight how the heading has a create id.
+ Point out how the links on the side are just using anchoring to navigate the page.

---

## Location, History and Anchor Demo!

+ [Location](https://developer.mozilla.org/en-US/docs/Web/API/Window/location)
+ [History](https://developer.mozilla.org/en-US/docs/Web/API/Window/history)

Note:
+ **Let's try utilizing these web API functionalities in our demo.**
+ Show weekly meal planner page.
+ **As we can see down below, right above my latin, we have our random recipe idea links. The general idea here is that we would have these specific recipes added to this web page down the line and by clicking these random recipe ideas, my web page should add them to This Week's Recipe, so I know which recipe to reference. Right now, that functionality doesn't exist though. Let's add some DOM manipulation to help us with that.**
```js
//create event handler that adds to our recipes list

// So, once again, we'll define an event handler callback known as addRecipe that takes an event as an argument:
const addRecipe = (e) => {

    // Again, we want to click one of our random recipe ideas and then add that recipe to This Week's Recipe, so let's first capture that random recipe idea I've picked and persist it to our lsRecipes array. Remember, I'm using my lsRecipes array to persist data to my localStorage.
    let recipeText = e.target.innerText;
    // Note that I'm taking my event target, which should be one of the random recipe idea elements, and then taking its innerText and saving it to a variable.
    lsRecipes.push({ recipeText });
    // Then we can construct a basic object with that recipe text and push it into our lsRecipes array.
    localStorage.setItem("recipes", JSON.stringify(lsRecipes))
    // Then similar to before, I can stringify that lsRecipes array and persist it to my localStorage under the key of "recipes".

    // Finally, we'll make a call to our updateWeeklyRecipe function.
    updateWeeklyRecipe();
}

// Now before we look at our updateWeeklyRecipe function, we do need to add one more thing so our addRecipe callback is effective.
// Can anyone tell me what we still need at this point?
// Again, our random recipe ideas click event listener! We still need to add an event listener that checks to see if I've clicked one of my random recipe ideas and uses the addRecipe callback we have, so let's do so:

// SCROLL DOWN

//add event listener to to add recipe

// Again, we can access our recipeList variable which has captured our list of random recipes ul and add a click event listener to it.
recipeList.addEventListener("click", addRecipe);
// If someone clicks this list, we can invoke our addRecipe callback
```

+ **Awesome, we have our click event listener for our random recipe list and a callback that will add that recipe to our localStorage. So, what is that updateWeeklyRecipe function that we're also invoking doing though? Let's walk through it.**
```js
//create action to render our recipes list
const updateWeeklyRecipe = () => {
    // Inside of this function, the first thing we do is grab our recipes variable, which is a DOM object capturing an header below our 'This Week's Recipe:' header
    // We are then setting its innerHTML, which needs to be set to a string. Again, we used this method earlier, so I'll need to provide strings of HTML elements I want to nest in this recipes DOM element.
    // So, we are taking our lsRecipes array, which is pulling data from our localStorage and for each recipe living there, we create an <a> tag or link with that recipe name interpolated as its innerText.
    // Also notice that each <a> tag is given a class of "recipeText". This will come into play soon enough.
    recipes.innerHTML = lsRecipes.map((recipe) => {
        return `
            <a href="" class="recipeText">
                ${recipe.recipeText}
            </a>
            `
    });

    // This should add picked recipes to our This Week's Recipe list and also make the picked recipes into links.

    // Now that they're links, let's add an event listener to This Week's Recipe. Let's imagine that our page is much longer and we have recipe sections for all of these random recipes. Similar to the ActiveRecord sidebar, let's try and utilize our Location and its hash method to add URL anchoring for those recipes.

    // At this point, we can add a click event listener to our week's recipes ul.
    recipes.addEventListener('click', (e) => {
        
        // if we do click somewhere in our this week's recipes element, we could check to see if the clicked element is one of our recipe links by its class (remember, all of those a tags have a class of 'recipeText')
        
        if (e.target.classList.contains('recipeText')) {
            // so if their classList contains that text, then first we can stop Propagation because we don't want that click to bubble up
            e.stopPropagation();
            // then we can also prevent Default so that link doesn't attempt an http request to a blank href
            e.preventDefault();

            // now we can take our recipe name from our target and save it to a variable
            let text = e.target.innerText;
            // and finally, we can use our location property from our window API and then access the Location's hash via the hash method
            // and we can set that to our text variable which has our recipe name
            window.location.hash = text.trim();
            // let's try testing this out now
        }
    })

}
```

+ Refresh page. Click a random recipe.
+ **As we can see, due to our click event listener for our random recipe list and our addRecipe callback, this adds the clicked recipe text as a link to our This Week's Recipe section.**
+ **Now, if I click This Week's Recipe. This should interpolate into my Location Object's hash and essentially create an anchor URL. Let's test it.**
+ Click This Week's Recipe and examine the URL bar.
+ **Awesome, we're changing our URL to include an anchor. If our web page had an article with an id of that recipe, our use of that Anchor id would allow us to navigate to that article much more easily.**

+ **Any questions?**

---

## jQuery?

* **A JS library that abstracts much of the DOM manipulation for us**
  * Low-level => fast
  * Rapid Development
    * concise: "write less, do more"
    * Simplifies "complicated" AJAX calls and DOM manipulation
  * Multi-browser cross compatible

* **A solid understanding of Vanilla JS and Dom Manipulation means JQuery may not be necessary. Always ask yourself, ["Do I need JQuery?](https://blog.garstasio.com/you-dont-need-jquery/why-not/) or is Vanilla JS better for this application?"**

Note:
+ **So what is jQuery? It's a JavaScript library that abstracts a lot of DOM manipulation out of the way and makes things simpler for us. However, like the slide says, a solid grasp of Vanilla JS and the Document Object Model might make it so that jQuery isn't completely necessary for your purposes. We no longer touch JQuery in this program with the exception of AJAX, which you will learn about tomorrow.**

---

## Closing thoughts - Single Page App (SPA)

* A web app that interacts with the user by dynamically rewriting the current page rather than loading entire new pages from a server.

* The appropriate resources are dynamically loaded and added to the page as necessary, usually in response to user actions.

* [When to use Vanilla JavaScript vs jQuery](https://www.geeksforgeeks.org/when-to-use-vanilla-javascript-vs-jquery/)

Note:
+ **So, for this lectures closing thoughts: we'll begin talking about SPAs or Single Page Applications. What is a SPA? It's a web application that dynamically rewrites the current page rather than loading an entirely new page from our web server. If we think back to Rails and Views, for a lot of interactions, we'd redirect or render an entirely new view. We're moving forward now. We don't want to keep reloading. That's too slow. Instead, we want to give the illusion of multiple pages when we never leave our single page.**
+ **Like our slide says, to do this, the appropriate resources will be loaded and added to the page as necessary or when our user needs them.**
+ **Last, we have a piece of documentation putting Vanilla JS and jQuery head to head. I recommend checking this documentation out after tomorrow's material.**

---

# Questions

* [Cohort Resources](https://github.com/appacademy/cohort-resources/blob/master/study_guides/javascript/vanilla_javascript_cheatsheet.md)
    * This should help with the project!!

Note:
+ **For today's project, I highly recommend using the Cohort Resources GitHub repo. There's a lot of useful information in there. Outside of that, does anyone have any questions?**

---

# [Kahoot!](https://play.kahoot.it/v2/?quizId=6fb216da-a02d-482d-9b6b-32ef6dd0cedb)

