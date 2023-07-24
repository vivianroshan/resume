
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
            format: 'A4', // or 'A4', 'Letter', 'Legal', 'Tabloid', etc.
            printBackground: true,
            margin: {
                top: '40px',
                right: '30px',
                bottom: '30px',
                left: '30px',
            },
        };
        await page.pdf(pdfOptions);
        console.log(args[3]);
    } catch (error) {
        console.error('Error saving the ' + args[2] + ' as PDF:', error);
    } finally {
        await browser.close();
    }
})();
