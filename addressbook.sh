#!/bin/bash

ADDRESS_BOOK="addressbook.txt"

add_contact() {
  echo "Enter Name:"
  read name
  echo "Enter Phone Number:"
  read phone
  echo "Enter Email:"
  read email

  echo "$name, $phone, $email" >> "$ADDRESS_BOOK"
  echo "Contact added!"
}


search_contact() {
  echo "Enter search term (name, phone, or email):"
  read search_term
  grep -i "$search_term" "$ADDRESS_BOOK" || echo "No contact found."
}

remove_contact() {
  echo "Enter Name, Phone, or Email of the contact to remove:"
  read search_term

  grep -iv "$search_term" "$ADDRESS_BOOK" > temp && mv temp "$ADDRESS_BOOK"
  echo "If the contact existed, it has been removed."
}

case "$1" in
  add)
    add_contact
    ;;
  search)
    search_contact
    ;;
  remove)
    remove_contact
    ;;
  *)
    echo "Usage: $0 {add|search|remove}"
    ;;
esac
