module.exports = {
  ...require('eslint-config-dmitmel/prettier.config.js'),
  plugins: ['prettier-plugin-astro', 'prettier-plugin-tailwindcss', 'prettier-plugin-prisma'],
  overrides: [
    {
      files: '*.astro',
      options: {
        parser: 'astro',
      },
    },
  ],
};
