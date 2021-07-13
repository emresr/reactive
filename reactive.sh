echo "Reactive next 2 react."

#Rename main folder
mv next-app react-app

## Create /src and subfolders
mkdir react-app/src
mv react-app/components react-app/src/components
mv react-app/utils react-app/src/utils

## Create src files
echo $'import React, { FC } from \"react\";\r\nimport ReactDOM from \"react-dom\";\r\nimport \"./index.css\";\r\nimport App from \"./components/App\";\r\n\r\nReactDOM.render(<App />, document.getElementById(\"root\"));' > react-app/src/index.tsx
mv react-app/styles/globals.css  react-app/src/index.css

# components folder
touch react-app/src/components/App.tsx
rm -rf react-app/pages/__app.tsx

# handle pages/files
routes=`cd  react-app/pages/ && ls  *.tsx`
route_arr=( $routes )
for i in "${route_arr[@]}"; do echo "import ${i%%.*} from \"./${i%%.*}\" " >> react-app/src/components/App.tsx; done

# handle pages/folders
page_folders=`cd  react-app/pages/ && ls -d */`
folder_arr=( $page_folders)
for i in "${folder_arr[@]}"; do echo "import ${i%%.*} from \"./${i%%.*}\" " >> react-app/src/components/App.tsx; done

echo $"import React, { FC } from 'react';\r\nimport { BrowserRouter, Switch, Route, Link } from 'react-router-dom';\r\n">> react-app/src/components/App.tsx; 
echo $'const App: FC<{}> = () => {\r\n  return (\r\n    <Layout>\r\n      <BrowserRouter>\r\n        <Switch> ' >> react-app/src/components/App.tsx
for i in "${route_arr[@]}"; do echo "          <Route exact path=\"/${i%%.*}\" component={${i%%.*}} /> " >> react-app/src/components/App.tsx; done
for i in "${folder_arr[@]}"; do echo "          <Route exact path=\"/${i%%.*}:id\" component={${i%%.*}} /> " >> react-app/src/components/App.tsx; done

echo $'        </Switch>\r\n      </BrowserRouter>\r\n    </Layout>\r\n  );\r\n};\r\n\r\nexport default App;' >> react-app/src/components/App.tsx
mv react-app/pages/* react-app/src/components


# 




## Replace next-env.d.ts with react-app.env.d.ts
rm  react-app/next-env.d.ts
echo $'/// <reference types=\"react-scripts\" />' > react-app/src/react-app.env.d.ts

## Create public/index.html for React
touch react-app/public/index.html


## Delete useless folders
rm -rf react-app/pages
rm -rf react-app/.next


## Todo 
# App.tsx routes
# prettier