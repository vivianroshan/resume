
const puppeteer = require('puppeteer');
const args = process.argv;

(async () => {
  const browser = await puppeteer.launch({headless: "new"});
  const page = await browser.newPage();
  try {
    const url = args[2];
    await page.goto(url, { waitUntil: 'networkidle0' });
    const pdfOptions = {
      path: args[3],
    };
    await page.pdf(pdfOptions);
    console.log(args[3]);
  } catch (error) {
    console.error('Error saving the ' + args[2] + ' as PDF:', error);
  } finally {
    await browser.close();
  }
})();
