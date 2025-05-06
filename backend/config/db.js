import mongoose, { connect } from "mongoose";

export const connectDB = async() => {
    await mongoose.connect('mongodb+srv://greatstack:1234123@cluster0.3xpkeaq.mongodb.net/TastyFoodMobileApp').then(()=> console.log("DB connected"))
}