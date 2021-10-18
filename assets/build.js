const vuePlugin = require('esbuild-vue');
const watch = !!process.env.ESBUILD_WATCH;

const promise = require('esbuild').build({
    entryPoints: ['js/app.js'],
    bundle: true,
    target: 'es2016',
    outdir: '../priv/static/assets',
    plugins: [vuePlugin()],
    logLevel: process.env.ESBUILD_LOG_LEVEL || 'silent',
    watch,
    define: {
        "process.env.NODE_ENV": JSON.stringify("development"),
    },
});

if (watch) {
    promise.then(_result => {
        process.stdin.on('close', () => {
            process.exit(0);
        })

        process.stdin.resume();
    })
}