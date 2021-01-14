An template for an application including :
- Spring boot
- Postgresql database access
- Flyway to create database schema
- Bulma for CSS Design
- Jsweet to generate .d.ts files from Java classes
- Webpack bundling typescript files with dependencies
- VueJS for vue development

# To instantiate : 
## Run for templating:   
> ./template.sh DEST_FOLDER githubusername MyApp MyBean myscreenname
Where :
- DEST_FOLDER is the folder to put the generated code 
- githubusername is your githubusername
- MyApp is the name of the java class for yout App
- MyBeam is an example of a bean and table
- myscreenname is a name of the mains screen of the application

# Move to generated code :
> cd DEST_FOLDER

## Then run for generating code in one liner: 
> mvn eclipse:eclipse && mvn jsweet:jsweet && npm install && ./node_modules/.bin/webpack --env development

## Create postgresql database : 
> psql -U postgres -f src/main/db/createdb.sql

## Run the app : 
> mvn spring-boot:run

## Open following url in browser :
> <http://localhost:8080/>

# Details
## Generate Eclipse project: 
> mvn eclipse:eclipse

## To generate .d.ts files from java: 
> mvn jsweet:jsweet

## To install js dependencies : 
> npm install

## To build js bundles from .ts files one time: 
> ./node_modules/.bin/webpack --env development

## To build js bundles from .ts files by watching contents :  
> ./node_modules/.bin/webpack --watch --env development
