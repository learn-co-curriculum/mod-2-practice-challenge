# Rails Practice Code Challenge - Bands

For this practice challenge, you'll be working with a Bands and Musicians domain.

Your job is to add the functionality described in the deliverables below.

## Topics

- MVC
- REST
- Request-Response Cycle
- Forms and Form Helpers
- ActiveRecord
- Validations

## Setup

Before you begin coding your solution, clone this repo and then `cd` into it. Then run `bundle install` to install dependencies, and run `rails s` to start the server.

## Testing Your Work

Although a test suite is included with this practice challenge, avoid running it until you've completed the whole challenge or several deliverables. Rely on behaviorally-driven development instead; you will not have a test suite during the actual challenge, so it's important to get comfortable with testing your code yourself.

## Domain

There are three models in the domain: Band, Musician, and a join model BandMember.

Musicians and Bands have a many to many relationship through BandMembers. A single BandMember belongs to one Band and one Musician.

## What You Already Have

The starter code is currently an empty Rails project. You will need to create and run all of the migrations yourself to generate the correct schema and relationships. You will also need to create the routes, controllers, and views to support listing Bands and Musicians.

### Model Methods and Validations
- None

### Routes, Controllers and Views
- None

### Seed Data
- There is seed data for every model
- You will need to create the migrations and models for Band, Musician, and BandMember before running `rails db:seed`

## Instructions

Update the code of the application to meet the following deliverables. Follow RESTful naming conventions and the MVC pattern to divide responsibility.

***Read through these deliverables carefully to understand the requirements for this code challenge. Tackle them one by one, as they build on each other sequentially.***

### 1. Band Migration and Model

Generate and run a migration to create the following schema for a Band:
- name: string
- created_at: DateTime
- updated_at: DateTime

Generate the model file.

### 2. Musician Migration

Generate and run a migration to create the following schema for a Musician:
- name: string
- age: integer
- created_at: DateTime
- updated_at: DateTime

Generate the model file.

### 3. BandMember Migration and Model

To track which Musicians belong to which Bands, we need to create a BandMember model. Update the schema and models so that:
- A Musician can be in many Bands
- Bands can have many Musicians
- BandMember stores the instrument a Musician plays in a Band as a string, e.g. 'guitar'

### 4. Create the Band Index Page

Generate the appropriate routes, controller actions and views so that navigating to `/bands`:
- Displays a list of every Band
- Links the name of each Band to a Band show page

### 5.  Create the Musician Index Page

Generate the appropriate routes, controller actions and views so that navigating to `/musicians`:
- Displays a list of every Musician
- Links the name of each Musician to a Musician show page

### 6. Complete the Band Show Page

Display the following information:
- Band name
- List of Musicians in the Band
- The name of each Musician should link to the Musician show page
- Next to each Musician's name, display the instrument the Musician plays in that specific Band

### 7. Complete the Musician Show Page

Display the following information:
- Musician name
- Musician age
- List of Bands the Musician plays in
- Each Band name should link to a Band show page

### 8.  New BandMember Form

A user can associate a Band with a Musician via a form. They can:
- Choose an existing Band by name from a dropdown
- Choose an existing Musician by name from a dropdown
- Enter an instrument name
- Submit the form

After submitting the form, the user should be redirected to the selected Band's show page.

### 9. BandMember Validation

Add a validation to the BandMember model, so that:
- An instrument's name is at least 3 characters long
- Add handling for this error to appear on the BandMember create action
- The validation should be shown on the BandMember creation form when a user tries to create a BandMember with an invalid instrument

### 10. Advanced: Additional BandMember Validation

A Musician should not be listed in the same Band twice:
- Add a validation to BandMember to ensure a Musician is only listed in a Band once
- Update the error handling on the BandMember creation form to show the validation error
- The validation error should read "Musician can only be listed in the same band once"

### 11. Advanced: Band Average Age

On the Band show page, show the average age of all Musicians in the Band. The average is the mean age (sum all ages and then divide by the number of band members).

### 12. Advanced: Musician Index Page Ordering

On the Musician index page, order the Musicians according to how many Bands they are in. Musicians in the most Bands should appear first, and Musicians in the least Bands should appear last.

### 13. Advanced: Band Show Page Musician Ordering

On the Band show page, order the Musicians by age going from oldest to youngest.

## Rubric

### Models, Associations, and Validations

1. Models, associations, and validation not started or have errors that prevent the application from running. Missing validations, or validation syntax is incorrect. May have introduced models outside the specified domain.
2. Models, associations, and validations attempted but incomplete or have errors. Associations may construct the wrong relationships. Validations may be missing or applied to the wrong models. Advanced query methods incomplete or have errors.
3. Models, associations, and validations mostly complete and correct per the deliverables. Advanced validations and methods may be incomplete. May have unused or unnecessary code, possibly including duplication. May have written validations instead of using appropriate built-in validations. May implement advanced query methods with iterators instead of using built-in methods.
4. All models, associations, and validations are complete and correct, save minor mistakes in advanced deliverables. Advanced validations are complete and add informative error messages.
5. All specified models, associations, and validations complete and correct. Built-in validations are used when appropriate. Variable and method names are intention-revealing. Models have appropriate logic extracted from controllers and views. Advanced query methods use appropriate built-in methods.

### Routes, Controllers, and REST

1. Routes missing, naming does not follow REST, controller actions incomplete or with errors.
2. Some routing and controller logic implemented, but incompletely or incorrectly. May have routes or controller actions not included in the deliverables. May include routes that have no corresponding controller action or vice versa. Controller methods might do work beyond their responsibility in MVC.
3. Most routing and controller logic working as specified. Some advanced deliverables may be incomplete. Routing follows REST convention. Routing table might include some unused routes, or routes and actions that were not specified in the deliverables. Logic may be duplicated between methods.
4. Nearly all routing and controller deliverables completed, possibly with minor errors in advanced deliverables. Routing follows REST conventions. Some logic may be duplicated between controller actions, or not respect MVC separation of concerns. Attempts to use filters and private helper methods to reduce duplication, but some duplication may remain.
5. All routes and controllers deliverables work as described in the instructions. Routing follows REST naming conventions. Controller actions respect MVC separation of concerns, and don't have logic that belongs in the model or the view. ActionController filters and private helper methods are used appropriately to reduce duplication in controller actions.

### Views and Forms

1. Missing or unattempted views and forms, or erb syntax errors in views and forms. Forms created in the wrong views, do not accept the correct input, or do not submit to the correct location. Data not displayed correctly.
2. Views display some data correctly. Forms attempted, but with some errors that prevent submitting data correctly. May not have attempted or may have significant errors in advanced deliverables.
3. Uses view to show data as specified. At least one working form that submits data to the correct location. May not have attempted some advanced view features. May have included views not specified by the deliverables. May include model or controller logic in the view. Forms may accept invalid input (for example, out of range numbers). May not display validation errors correctly. May not use view helper methods to reduce duplication.
4. Nearly all view and form deliverables are complete and correct. May have minor logic errors in advanced deliverables. Mostly does not include controller or model logic in the views. Mostly uses helpers to reduce duplication.
5. All view and form deliverables are complete and correct, including advanced form components. No views not specified by the instructions. No model or controller logic present in the views. Appropriate use of helpers and built-ins to reduce duplication. Validation errors displayed correctly on form.
