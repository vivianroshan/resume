
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
    console.log('Website saved as PDF successfully.');
  } catch (error) {
    console.error('Error saving the website as PDF:', error);
  } finally {
    await browser.close();
  }
})();
