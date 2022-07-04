const express = require('express');

const app = express();
const port = 1234;

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', '*');
    next();
});

app.get('/esi', (req, res) => {
    res.send('ESI from the API');
    res.end();
});

app.listen(port, () => {
    console.log('info', `App listening on port ${port}`, {});
});

const shutdown = (exitCode) => {
    console.log('info', 'Server shutting down', {});
    dataSource.disconnectFromDB();
    process.exit(exitCode + 128);
};

process.on('SIGINT', () => {
    shutdown(2);
});
process.on('SIGABRT', () => {
    shutdown(6);
});
process.on('SIGTERM', () => {
    shutdown(15);
});