#!/usr/bin/env bash
set -euo pipefail

APP_NAME="indiegamer-hub"
ROOT_DIR="${1:-$APP_NAME}"

mkdir -p "$ROOT_DIR"
cd "$ROOT_DIR"

mkdir -p \
  server/{config,controllers,middleware,models,routes,services,utils,seed,uploads/{games,avatars,reviews},tests} \
  client/{public,src/{assets,components/{common,layout,game,forum,review,ui},context,hooks,pages/{auth,dashboard,games,home,admin},routes,services,styles,utils},tests} \
  docs/{ppt,pdf,diagrams,images} \
  scripts

cat > .gitignore <<'EOF'
node_modules
.env
.env.local
dist
build
coverage
.DS_Store
Thumbs.db
server/uploads/*
!server/uploads/.gitkeep
client/.vite
EOF

cat > .env.example <<'EOF'
NODE_ENV=development
PORT=5000
MONGO_URI=mongodb://127.0.0.1:27017/indiegamer_hub
JWT_SECRET=change_me
STEAM_API_KEY=change_me
RAWG_API_KEY=change_me
CLIENT_URL=http://localhost:5173
EOF

cat > package.json <<'EOF'
{
  "name": "indiegamer-hub",
  "private": true,
  "workspaces": ["client", "server"],
  "scripts": {
    "dev": "concurrently \"npm run dev --workspace server\" \"npm run dev --workspace client\"",
    "setup": "bash create_project.sh"
  },
  "devDependencies": {
    "concurrently": "^9.0.0"
  }
}
EOF

cat > README.md <<'EOF'
# IndieGamer Hub
MERN internship project scaffold.
EOF

cat > server/package.json <<'EOF'
{
  "name": "indiegamer-hub-server",
  "version": "1.0.0",
  "main": "src/server.js",
  "scripts": {
    "dev": "node src/server.js",
    "start": "node src/server.js"
  }
}
EOF

mkdir -p server/src
cat > server/src/server.js <<'EOF'
const express = require('express');
const app = express();

app.use(express.json());

app.get('/health', (req, res) => res.json({ ok: true }));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on ${PORT}`));
EOF

cat > client/package.json <<'EOF'
{
  "name": "indiegamer-hub-client",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  }
}
EOF

mkdir -p client/src
cat > client/index.html <<'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IndieGamer Hub</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
EOF

cat > client/src/main.jsx <<'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

ReactDOM.createRoot(document.getElementById('root')).render(<App />);
EOF

cat > client/src/App.jsx <<'EOF'
import React from 'react';

export default function App() {
  return <div>IndieGamer Hub</div>;
}
EOF

cat > client/vite.config.js <<'EOF'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()]
});
EOF

find . -type d -empty -exec touch {}/.gitkeep \;

echo "Project scaffold created in: $ROOT_DIR"