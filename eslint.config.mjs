import globals from "globals";
import tsParser from "@typescript-eslint/parser";

export default [
    {
        parser: tsParser,
        parserOptions: {
            ecmaVersion: 2020,
            sourceType: "module",
            ecmaFeatures: {
                jsx: true,
            },
        },
        env: {
            browser: true,
            es2021: true,
        },
        globals: globals.browser,
        extends: [
            "eslint:recommended",
            "plugin:@typescript-eslint/recommended",
            "plugin:react/recommended",
            "prettier",
        ],
        plugins: ["@typescript-eslint", "react"],
        settings: {
            react: {
                version: "detect",
            },
        },
    },
];