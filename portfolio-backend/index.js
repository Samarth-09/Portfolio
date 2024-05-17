import nodemailer from "nodemailer";
import e from "express";
import * as env from "dotenv";
env.config();
const app = e();

app.use(e.json({ extended: true }));
app.use((req, res, next) => {
  // Set CORS headers to allow cross-origin requests (required to communicate with flutter thorugh localhosting)
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Credentials", "true");
  res.setHeader("Access-Control-Allow-Headers", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "POST, OPTIONS, PUT, GET, DELETE"
  );

  next();
});
// app.use(e.urlencoded());

app.post("/sendEmail", (req, res) => {
  const body = req.body;
  let name = body.name;
  let email = body.email;
  let feedback = body.feedback;
  let number = body.number;
  let linkedin = body.linkedin_id;
  sendMailToUser(name, email);
  sendMailToMe(name, feedback, number, linkedin);
  res.json({ msg: "Done" });
});

const sendMailToUser = (name, email) => {
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "srparekh0909@gmail.com",
      pass: "ybll fwoi fnun mucv",
    },
  });
  var emailContent = `
  <p>Hello <b>${name}</b>! Just got your FeedBack. Thanks for your valuable time.</p>
  <p>ThankYou<br>Your Mate<br>Samarth R. Parekh</p> 
  `;
  const mailOptions = {
    from: "srparekh0909@gmail.com",
    to: email,
    subject: "Got Your FeedBack",
    html: emailContent,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      return false;
    }
    return true;
  });
};

const sendMailToMe = (name, feedback, number, linkedin) => {
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "srparekh0909@gmail.com",
      pass: "ybll fwoi fnun mucv",
    },
  });
  var emailContent = `
    <p>${name} has sent you the feedback.</p>
    <p>FeedBack:- <br>${feedback}</p> 
    <p>Number:- ${number}</p>
    <p>Linkedin-Id:- ${linkedin}</p>
    `;
  const mailOptions = {
    from: "srparekh0909@gmail.com",
    to: "srparekh0909@gmail.com",
    subject: "FeedBack from Portfolio",
    html: emailContent,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      return false;
    }
    return true;
  });
};

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log("started on " + port);
});
