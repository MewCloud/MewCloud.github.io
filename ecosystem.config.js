module.exports = {
    apps: [
        {
            name: 'mewcloud',
            script: 'node index.js',
            ignore_watch: ['node_modules'],
            instances: 1,
            autorestart: true,
            max_memory_restart: '1G',
        },
    ],
};
  