require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { PrismaClient } = require('@prisma/client');
const nodemailer = require("nodemailer");

const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());

// Referral API: Submit a referral
app.post('/referral', async (req, res) => {
    const { FriendName, FriendMail, FriendNumber, ReferredByName, ReferredByMail, ReferredByNumber } = req.body;

    if (!FriendName || !FriendMail || !FriendNumber || !ReferredByName || !ReferredByMail || !ReferredByNumber) {
        return res.status(400).json({ error: 'All fields are required' });
    }

    try {
        const referral = await prisma.referral.create({
            data: { FriendName, FriendMail, FriendNumber, ReferredByName, ReferredByMail, ReferredByNumber },
        });

        // Send email asynchronously
        sendMail(FriendName, ReferredByName, FriendMail);

        res.status(201).json(referral);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Could not create referral' });
    }
});

// Function to send email
async function sendMail(FriendName, ReferredByName, FriendMail) {
    try {
        let transporter = nodemailer.createTransport({
            host: "smtp.ethereal.email",
            port: 587,
            secure: false, 
            auth: {
                user: process.env.ETHEREAL_USER, // Use .env instead of hardcoding
                pass: process.env.ETHEREAL_PASS, 
            },
        });

        let mailOptions = {
            from: '"Accredian" <' + process.env.ETHEREAL_USER + '>',
            to: FriendMail, // Send to the referred friend
            subject: "Welcome to the Fam!!",
            text: `Hey ${FriendName}, you've been referred by ${ReferredByName}. Thank you for joining.`,
        };

        let info = await transporter.sendMail(mailOptions);
        console.log("Message sent: %s", info.messageId);
        console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
    } catch (error) {
        console.error("Error sending email:", error);
    }
}

// Start Server
const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
