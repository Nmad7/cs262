import React, { useState, useEffect } from 'react';
import { ActivityIndicator, StyleSheet, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function Home({ navigation }) {
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);

    useEffect(() => {
        fetch('https://cs262-lab9.herokuapp.com/inProgress')
            .then((response) => response.json())
            .then((json) => setData(json))
            .catch((error) => console.error(error))
            .finally(() => setLoading(false));
    }, []);

    return (
        <View style={globalStyles.container}>
            <Text>Players currently in a game</Text>
            {isLoading ? <ActivityIndicator /> : (
                <FlatList data={data} keyExtractor={({ playerid }, index) => playerid.toString()} renderItem={({ item }) => (
                    <TouchableOpacity onPress={() => navigation.navigate('GameDetails', item)}>
                        <Card>
                            <Text style={globalStyles.titleText}>{item.emailaddress}</Text>
                        </Card>
                    </TouchableOpacity>
                )}
                />
            )}
        </View>
    );
}