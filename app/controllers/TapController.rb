class TapController < UIViewController
  FACES = {
    smile: '0x1F600',
    neutral: '0x1F610',
    frown: '0x1F622'
  }

  def viewDidLoad
    super

    # FACES.each_with_index do |face, index|
    #   label = UILabel.alloc.initWithFrame(CGRectZero)
    #   label.text = face[1].hex.chr(Encoding::UTF_8)
    #   label.sizeToFit
    #   x = self.view.frame.size.width / 2
    #   y = 50 + (25*index)
    #   label.center = CGPointMake(x, y)
    #   self.view.addSubview(label)
    # end
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.dataSource = self
    @table.delegate = self
    self.view.addSubview @table
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = face_emoji(indexPath.row) + " #{face_name(indexPath.row)}"

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    FACES.keys.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{face_name(indexPath.row)} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end

  private

  def face(index)
    face = FACES.to_a[index]
  end
  def face_emoji(index)
    face(index)[1].hex.chr(Encoding::UTF_8)
  end
  def face_name(index)
    face(index)[0].capitalize
  end
end
