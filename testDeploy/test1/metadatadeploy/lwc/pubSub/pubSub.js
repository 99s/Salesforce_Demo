/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-04-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
const store = {};

const subscribe = (eventName, callback) => {
    if (!store[eventName]) {
        store[eventName] = new Set();
    }
    store[eventName].add(callback);

};

const unsubscribe = (eventName, callback) => {
    if (!store[eventName]) {
        store[eventName].delete(callback);
    }
};

const publish = (eventName, payload) => {
    if (store[eventName]) {
        store[eventName].forEach(callback => {
            try {
                callback(payload);
            } catch (error) {
                console.error(error);
            }
        })
    }
};

export default {
    subscribe,
    unsubscribe,
    publish
};