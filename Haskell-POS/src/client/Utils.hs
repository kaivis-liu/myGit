
module Utils where

type Name = String
type Password = String

type UserInfo = (Name,Password)
type UsersInfo = [UserInfo]

users ::UsersInfo
users = []