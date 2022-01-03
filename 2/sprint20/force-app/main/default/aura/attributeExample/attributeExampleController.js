({
	doClick: function(component, event, helper) {
		alert(component.isValid());
        alert(component.getName());
        alert(component.getType());
        alert(component.getVersion());
        alert(component.get('v.whom'));
        component.set('v.whom',"Test Value");
        var agecomp = component.get('testInput');
        alert(agecomp.get('v.value'));
	}
})