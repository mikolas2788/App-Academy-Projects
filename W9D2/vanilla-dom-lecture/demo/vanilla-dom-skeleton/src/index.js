//grab the dom elements we need (groceries, grocery-form, recipe-list, recipes)

const groceriesList = document.querySelector(".groceries");
const groceryForm = document.querySelector(".grocery-form");
const recipeList = document.querySelector(".recipe-list");
const recipes = document.querySelector(".recipes");

//create variables to hold localStorage things
const lsItems = JSON.parse(localStorage.getItem('items')) || [];
const lsRecipes = JSON.parse(localStorage.getItem('recipes')) || [];

//---------------PHASE 1 DOM MANIPULATION DEMO-----------------//
//create event handler that adds to our grocery list
const addItem = (e) => {
 e.preventDefault();
 let input = document.querySelector("input[name='add-grocery']");
 let value = input.value;
 const item = {value: value};
 lsItems.push(item);
 localStorage.setItem("items", JSON.stringify(lsItems));

 groceryForm.reset();
 updateList();

}

//create action to render grocery list items
const updateList = () => {

    // method 1: using string html element
    // groceriesList.innerHTML = lsItems.map(item => {
    //     return `<li>${item.value}</li>`;
    // })
   
    // method 2: using document.createElement
    let li = document.createElement('li');

    li.innerText = lsItems[lsItems.length-1].value;

    groceriesList.appendChild(li);
}

//create event handler to cross out list items on click
const markAsDone = (e) => {
    e.stopPropagation();

    let ele = e.target;

    ele.classList.toggle('done');    

}

//---------------PHASE III FOR WINDOW, LOCATION, HISTORY DEMO-----------------//

//create event handler that adds to our recipes list
const addRecipe = (e) => {

    let recipeText = e.target.innerText;

    lsRecipes.push({ recipeText }); // syntactic sugar
    localStorage.setItem("recipes", JSON.stringify(lsRecipes))

    updateWeeklyRecipe();
}

//create action to render our recipes list
const updateWeeklyRecipe = () => {

    recipes.innerHTML = lsRecipes.map((recipe) => {
        return `
            <a href="" class="recipeText">
                ${recipe.recipeText}
            </a>
            `
    });

    recipes.addEventListener("click", (e) => {
        if (e.target.classList.contains('recipeText')) {
            e.stopPropagation();
            e.preventDefault();

            let text = e.target.innerText;
            window.location.hash = text.trim();
        }
    })
    
}
//ADD AN EVENT LISTENER to set window.location.hash


//---------------------------------------------------------------------//

//add event listener to on submit for form to process add item
groceryForm.addEventListener("submit", addItem);

//add event listener to cross out a list item
// groceriesList.addEventListener("click", markAsDone);

//add event listener to to add recipe
recipeList.addEventListener("click", addRecipe);

//call our methods to populate DOM


//--------------------PHASE II EVENT BUBBLIING DEMO---------------------------------//

let groc = document.querySelectorAll(".groceries li") //select the li's
groc.forEach((child) => {
    child.addEventListener("click", markAsDone);
})
const boo = (e) => {
    alert("Boo from the groceries ul! You didn't expect this, did you?!")
}

groceriesList.addEventListener("click", boo); //parent

//---------------------------------------------------------------------//


//Script for LinkedIn endorsements
// let skills = document.getElementsByClassName('pv-skill-entity__featured-endorse-button-shared');
// for (let i = 0; i < skills.length; ++i) {
//     skills[i].click();
// }