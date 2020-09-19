const http = require('http');
const port = process.env.PORT || 3000;
const appVersion = process.env.APP_VERSION;
const hostName = process.env.HOST_NAME;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = `Hello World! ${appVersion} - ${hostName}`;
  res.end(msg);
});

server.listen(port, () => {
  console.log('running');
  console.log(`Server running on http://localhost:${port}/`);
});
