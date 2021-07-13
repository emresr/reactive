echo "Creating next-app next folder."

rm -rf react-app
rm -rf next-app
mkdir next-app

## Create .next folder
mkdir next-app/.next

## Create folders 
mkdir next-app/pages
mkdir next-app/components
mkdir next-app/utils
mkdir next-app/public
mkdir  next-app/styles
mkdir next-app/types 

## Create pages 
touch  next-app/pages/__app.tsx
touch  next-app/pages/index.tsx
touch  next-app/pages/feed.tsx
touch  next-app/pages/post.tsx

## Create pages folder
mkdir next-app/pages/post
touch  next-app/pages/post/[id].tsx

## Create components
touch next-app/components/layout.tsx

## Create utils
touch next-app/utils/calculate.tsx

## Create next-env.d.ts
touch next-app/next-env.d.ts
echo $'/// <reference types=\"next\" />\r\n/// <reference types=\"next/types/global\" />' > next-app/next-env.d.ts

## Pages folder 
echo $'import { AppProps } from \"next/app\";\r\nimport { FC } from \"react\";\r\nimport \"../styles/globals.scss\";\r\n\r\nconst App: FC<AppProps> = ({ Component, pageProps }) => {\r\n   return <Component {...pageProps} />;\r\n};\r\n\r\nexport default App;'> next-app/pages/__app.tsx

## Styles folder
touch next-app/styles/globals.css 