import React, { useState } from 'react';
import { StyleSheet, Text, View, Button, TextInput, FlatList } from 'react-native';

export default function App() {
  const [name, setName] = useState('...');
  const [age, setAge] = useState('0');
  const [birthdays, setBirthdays] = useState([]);

  const pressHandler = () => {
    var newAge = parseInt(age) + 1
    setAge(parseInt(newAge))
    setBirthdays(birthdays.concat({ key: newAge.toString() }))
  };


  return (
    <View style={styles.container}>
      <Text>Enter name:</Text>
      <TextInput
        style={styles.input}
        placeholder='e.g. John Doe'
        onChangeText={(val) => setName(val)} />

      <Text>{name} is {age} years old</Text>
      <View style={styles.buttonContainer}>
        <Button title='BIRTHDAY' onPress={pressHandler} />
      </View>
      <FlatList
        data={birthdays}
        renderItem={({ item }) => (
          <Text>{item.key}</Text>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginTop: 20,
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {
    borderWidth: 1,
    borderColor: '#777',
    padding: 8,
    margin: 10,
    width: 200,
  },
  buttonContainer: {
    marginTop: 20
  }

});
