## REACT

> React is a library for making frontend ui. It makes a virtual DOM (copy of a real DOM) then compares it with the real dom and only re-render the difference. This way it does not make any unnecessary re renders and increase website performance.

### SET UP WITH VITE

```bash
npm create vite
```

BASIC REACT FOLDER STRUCTURE

```bash
my-vite-react-app/
│
├── node_modules/            # Installed dependencies (auto-generated)
│
├── public/
│   └── vite.svg             # Public assets (served as-is)
│
├── src/
│   ├── assets/              # Images, icons, fonts
│   │   └── react.svg
│   │
│   ├── App.jsx              # Root React component
│   ├── App.css              # App-level styles
│   │
│   ├── main.jsx             # Entry point (ReactDOM.createRoot)
│   │
│   └── index.css            # Global styles
│
├── .gitignore               # Git ignored files
│
├── index.html               # Main HTML file (Vite injects JS here)
│
├── package.json             # Project metadata & scripts
├── package-lock.json        # Dependency lock file (or pnpm/yarn lock)
│
├── vite.config.js           # Vite configuration
│
├── eslint.config.js         # ESLint configuration
│
└── README.md                # Project documentation
```

To Run The App :

```bash
# Make sure you are in the folder where the pakage.json locates.
npm run dev
```