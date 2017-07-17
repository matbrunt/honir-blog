---
title: "Visualising Classification Performance with ROC and AUC"
date: 2017-04-26T21:53:56Z
draft: false
---

The *Receiving Operating Characteristic*, or ROC, is a way to visualise the performance of a binary classifier (0/1).

It compares the rate at which your classifier is making correct predictions (True Positives or TP) and the rate at which your classifier is making false alarms (False Positives or FP).

When evaluating a new model performance, *accuracy* can be very sensitive to unbalanced class proportions.  The ROC curve is insensitive to this lack of balance in the data set.

On the other hand when using precision and recall, we are using a single discrimination threshold to compute the confusion matrix. The ROC Curve allows the modeler to look at the performance of his model across all possible thresholds.

When plotting the ROC curve on the x axis we show the false positive rate (FPR or fall-out rate), and on the y axis we show the true positive rate (TPR or recall).

TPR = True Positives / (True Positives + False Negatives)
FPR = False Positives / (False Positives + True Negatives)

## ROC curves: the basics

### Guessing

The first example is the simplest: a diagonal line. A diagonal line indicates that the classifier is just making completely random guesses. Since your classifier is only going to be correct 50% of the time, it stands to reason that your TPR and FPR will also be equal.

Often ROC charts will include the random ROC curve to provide the user with a benchmark for what a naive classifier would do. Any curves above the line are better than guessing, while those below the line...well you're better off guessing.

### Perfect Classifier

If you make every prediction correctly you will have a perfect trade off between TPR and FPR - so the TPR will be 1, and the FPR will be 0.

### A Bad Classifier

A bad classifier, i.e. something worse than guessing, will appear below the random guessing line. You might as well just guess in that case.

### An Ok Classifier

Trying to decipher the difference between an OK and a Good classifier can be interesting.

Context plays a large part, but a basic rule is a curve only slightly above the random guessing line is Ok. Be _very wary_ of lines that dip, in practice this can mean there's irregularity within the data, or you're making a bad assumption in your model.

### Pretty Good Classifier

This will form a nice hump away from the random guessing line, starting at 0 FPR / 0 TPR, then rising to its highest point in the middle of the curve, and falling back to 1 FPR / 1 TPR. It has a 'hump' shape that is continually increasing, and is being pulled up into the perfect top left spot of the chart (lower FPR, higher TPR).

## Area Under The Curve (AUC)

This 'hump' shape is the Area Under The Curve (AUC). It's a placeholder number that describes how well the TPR and FPR values look.

An AUC of 0 is Bad.
An AUC of 1 is Good.

As a rule of thumb you can use the following boundaries to evaluate your model:

- .90-1 = very good

- .80-.90 = good

- .70-.80 = not so good

- .60-.70 = poor

- .50-.60 = fail

The more the curve heads to the sweet spot in the top left of the ROC curve, the larger the AUC will be, and the better your classifier is.

Comparing AUC values is useful when comparing different models as well, as you can select the model with the highest AUC value, rather than examining all the curves.

## Implementing a ROC curve in Python

Using `scikit-learn` makes it very easy to calculate a ROC curve.

First we create a sample dataset then fit a logistic regression model against it.

	from sklearn.datasets import make_classification
	from sklearn.linear_model import LogisticRegression

	# Build a sample dataset and split into train/test sets
	X, y = make_classification(n_samples=10000, n_features=10, n_classes=2, n_informative=5)
	Xtrain = X[:9000]
	Xtest = X[9000:]
	ytrain = y[:9000]
	ytest = y[9000:]

	# Fit a logistic regression model against the training data
	clf = LogisticRegression()
	clf.fit(Xtrain, ytrain)

Now we can calculate the ROC curve for the model by passing in the actual y values from the test set, and the predicted probabilities for the same entries. This will give us our FPR and TPR values which we can plot to give us the ROC curve.

	from sklearn import metrics
	import pandas as pd

	preds = clf.predict_proba(Xtest)[:,1]
	fpr, tpr, _ = metrics.roc_curve(ytest, preds)
	roc_auc = metrics.auc(fpr, tpr)

	df = pd.DataFrame(dict(fpr=fpr, tpr=tpr))

Finally, we can plot the ROC curve using Matplotlib

	from matplotlib import pyplot as plt
	%matplotlib inline
	plt.title('Receiver Operating Characteristic')
	plt.plot(fpr, tpr, 'b', label='AUC = %0.2f'% roc_auc)
	plt.legend(loc='lower right')
	plt.plot([0,1],[0,1],'r--')
	plt.xlim([-0.1,1.2])
	plt.ylim([-0.1,1.2])
	plt.ylabel('True Positive Rate (TPR)')
	plt.xlabel('False Positive Rate (FPR)')
	plt.show()

## Example Curves

These examples all deal with a binary classifier (0,1). For multi-class examples have a look at the [scikit-learn documentation](http://scikit-learn.org/stable/auto_examples/plot_roc.html).

Article sourced from the following links:
[http://blog.yhat.com/posts/roc-curves.html](http://blog.yhat.com/posts/roc-curves.html)
[https://datamize.wordpress.com/2015/01/24/how-to-plot-a-roc-curve-in-scikit-learn/](https://datamize.wordpress.com/2015/01/24/how-to-plot-a-roc-curve-in-scikit-learn/)
