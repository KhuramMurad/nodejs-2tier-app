const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect("mongodb://mongo:27017/testdb", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const DataSchema = new mongoose.Schema({
  text: String,
});
const Data = mongoose.model("Data", DataSchema);

app.post("/save", async (req, res) => {
  const { text } = req.body;
  const newData = new Data({ text });
  await newData.save();
  res.json({ message: "Saved Successfully!" });
});

app.get("/fetch", async (req, res) => {
  const data = await Data.find();
  res.json(data);
});

app.listen(5000, () => console.log("Backend running on port 5000"));
