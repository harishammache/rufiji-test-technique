class Common {
    static wsRequest(url, method = 'GET', data = null, file = null, fn) {
        if (!file) {
            $.ajax({
                url: url,
                type: method,
                data: data,
            })
            .done(function(response) {
                response = JSON.parse(response);
                if (response.code_retour == 1) {
                    fn(response.resultat, null);
                } else {
                    fn(response.resultat, 'error');
                }
            })
            .fail(function() {
                fn(null, 'error');
            });
        } else {
            $.ajax({
                url: url,
                type: method,
                data: data,
                contentType: false,
                processData: false,
            })
            .done(function(response) {
                response = JSON.parse(response);
                if (response.code_retour == 1) {
                    fn(response.resultat, null);
                } else {
                    fn(response.resultat, 'error');
                }
            })
            .fail(function() {
                fn(null, 'error');
            });
        }
    }

    static wsRequestPromise(url, method = 'GET', data = null, file = null, resolve) {
        if (!file) {
            $.ajax({
                url: url,
                type: method,
                data: data,
            })
            .done(function(response) {
                response = JSON.parse(response);
                if (response.code_retour == 1) {
                    resolve(response.resultat, null);
                } else {
                    resolve(response.resultat, 'error');
                }
            })
            .fail(function() {
                resolve(null, 'error');
            });
        } else {
            $.ajax({
                url: url,
                type: method,
                data: data,
                contentType: false,
                processData: false,
            })
            .done(function(response) {
                if (response.code_retour == 1) {
                    resolve(response.resultat, null);
                } else {
                    resolve(response.resultat, 'error');
                }
            })
            .fail(function() {
                resolve(null, 'error');
            });
        }
    }

    static wsRequestWithPromise(url, method = 'GET', data = null, file = null, parse = true) {
        return new Promise((resolve, reject) => {
            if (!file) {
                $.ajax({
                    url: url,
                    type: method,
                    data: data
                })
                .done(function(response) {
                    if (parse) {
                        response = JSON.parse(response);
                    }
                    
                    if (response.code_retour == 1) {
                        resolve(response.resultat);
                    } else {
                        reject(response.resultat);
                    }
                })
                .fail(function(error) {
                    reject(error);
                });
            } else {
                $.ajax({
                    url: url,
                    type: method,
                    data: data,
                    contentType: false,
                    processData: false
                })
                .done(function(response) {
                    if (parse) {
                        response = JSON.parse(response);
                    }

                    if (response.code_retour == 1) {
                        resolve(response.resultat);
                    } else {
                        reject(response.resultat);
                    }
                })
                .fail(function(error) {
                    reject(error);
                });
            }
        });
    }
}
