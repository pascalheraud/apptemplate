#!/bin/bash
if [[ $1 = "" ]] || [[ $2 = "" ]] || [[ $3 = "" ]] || [[ $4 = "" ]] || [[ $5 = "" ]]; then
	echo "Usage $0 destinationfolder githubusername JavaClassName DBBeanName screenname"
	exit
fi  

DEST=$1
GITHUB_USER=$2
JAVA_CLASS=$3
LOWERCASE_NAME=${JAVA_CLASS,,}
BEAN_NAME=$4
BEAN_NAME_LC=${BEAN_NAME,,}
SCREEN_NAME=$5
cp -r src $DEST
cp package.json pom.xml tsconfig.json webpack.config.js .classpath .gitignore .project $DEST

cd $DEST

####Folders name
mv src/main/java/io/github/myusername src/main/java/io/github/$GITHUB_USER 
mv src/main/java/io/github/$GITHUB_USER/apptemplate src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME

mv src/main/resources/io/github/myusername src/main/resources/io/github/$GITHUB_USER
mv src/main/resources/io/github/$GITHUB_USER/apptemplate src/main/resources/io/github/$GITHUB_USER/$LOWERCASE_NAME

#####Files name
mv src/main/resources/templates/screentemplate.html src/main/resources/templates/$SCREEN_NAME.html
mv src/main/ts/screentemplate.ts src/main/ts/$SCREEN_NAME.ts
mv src/main/resources/static/css/apptemplate.css src/main/resources/static/css/$LOWERCASE_NAME.css
mv src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/AppTemplate.java src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/$JAVA_CLASS.java
mv src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/apis/AppTemplateApisController.java src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/apis/${JAVA_CLASS}ApisController.java
mv src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/web/AppTemplateController.java src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/web/${JAVA_CLASS}Controller.java
mv src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/db/BeanTemplate.java src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/db/$BEAN_NAME.java
mv src/main/java/io/github/$GITHUB_USER/$LOWERCASE_NAME/db/BeanTemplateDAO.java src/main/java/io/github/pascalheraud/checklist/db/${BEAN_NAME}DAO.java

####Files Content
REGEXPS="s/BeanTemplate/$BEAN_NAME/g
s/AppTemplate/$JAVA_CLASS/g
s/apptemplate/$LOWERCASE_NAME/g
s/myusername/$GITHUB_USER/g
s/screentemplate/$SCREEN_NAME/g
"

for REGEXP in $REGEXPS; do
	echo "Replacing using $REGEXP"
	find . \( -name '*.java' -or -name 'pom.xml' -or -name '*.properties' -or -name '*.json' -or -name '*.xml' \
	      -or -name 'webpack.config.js' -or -name '*.html' -or -name '*.ts' -or -name '*.sql' \) \
	      -exec sed -i "$REGEXP" {} \;
      
done

