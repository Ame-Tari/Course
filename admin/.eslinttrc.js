module.exports = {
    root: true,
    env: {
        node: true
    },
    'extends': [
        'plugin:vue/essential',
        'eslint:recommended'
    ],
    rules: {
        'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
        'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
        'no-undef': 0,
        'vue/no-unused-vars': 'off',
        'vue/require-v-for-key': 0,
        'no-unused-vars': 'off',
        'vue/no-unused-components': 'off'
    },
    parserOptions: {
        parser: 'babel-eslint'
    }
};