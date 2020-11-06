import React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { globalStyles } from '../styles/global';

import Card from '../shared/card';

export default function GameDetails({ route, navigation }) {
    return (
        <View style={globalStyles.container}>
            <Card>
                <Text>ID: {route.params.playerid}</Text>
                <Text>Email Address: {route.params.emailaddress}</Text>
                <Text>Name: {route.params.name}</Text>
                <Text>Score: {route.params.score}</Text>
                <Text>Cash: {route.params.cash}</Text>
                <Text>Currently in game number {route.params.gameid}</Text>
            </Card>
        </View>
    );
}
