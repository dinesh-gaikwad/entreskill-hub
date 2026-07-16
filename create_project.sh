bash -c 'APP=indiegamer-hub; mkdir -p "$APP" && cd "$APP" && \
mkdir -p server/{config,controllers,middleware,models,routes,services,utils,seed,src} client/src/{routes,pages/{home,auth,games,admin},components/{game,forum}} docs scripts && \
npm init -y >/dev/null 2>&1 && npm i concurrently >/dev/null 2>&1 && \
cd server && npm init -y >/dev/null 2>&1 && npm i express mongoose cors dotenv >/dev/null 2>&1 && npm i -D nodemon >/dev/null 2>&1 && cd .. && \
cd client && npm create vite@latest . -- --template react >/dev/null 2>&1 && npm i >/dev/null 2>&1 && npm i axios react-router-dom >/dev/null 2>&1 && cd .. && \
cat > .env.example <<EOF
NODE_ENV=development
PORT=5000
MONGO_URI=mongodb://127.0.0.1:27017/indiegamer_hub
JWT_SECRET=change_me
STEAM_API_KEY=change_me
RAWG_API_KEY=change_me
CLIENT_URL=http://localhost:5173
EOF
echo "DONE"'