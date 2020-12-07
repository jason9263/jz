package main

import (
	"fmt"
	"github.com/pkg/errors"
	"strconv"
	"strings"
)



func main() {

	a := 1
	b := ""
	if (4 > 3){
		a = 4
		b = "hello worl;d"
	}

	fmt.Print(a, b)
}

func getConditionAndEventIDConfigInfo(conditionConfig string, eventConfig string) (int, string, int, string, error) {

	idStartPosition := 9
	invalidID := -1

	// event ID and config
	eventIDEndPosition := strings.Index(eventConfig, ",")
	eventID, err := strconv.Atoi(strings.TrimSpace(eventConfig[idStartPosition:eventIDEndPosition]))
	if err != nil {
		return invalidID, "", invalidID, "", errors.Wrap(err, "fail in getConditionAndEventIDConfigInfo eventID")
	}
	eventConfigContent := eventConfig[eventIDEndPosition+1 : len(eventConfig)-1]

	// condition ID and config
	conditionIDEndPosition := strings.Index(conditionConfig, ",")
	conditionID, err := strconv.Atoi(strings.TrimSpace(conditionConfig[idStartPosition:conditionIDEndPosition]))
	if err != nil {
		return invalidID, "", invalidID, "", errors.Wrap(err, "fail in getConditionAndEventIDConfigInfo conditionID")
	}
	conditionConfigContent := "[" + conditionConfig[conditionIDEndPosition+1:]

	return conditionID, conditionConfigContent, eventID, eventConfigContent, nil
}
